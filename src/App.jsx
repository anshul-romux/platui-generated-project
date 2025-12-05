import React, { useState } from 'react';
import { Search, Globe, ChevronDown, ChevronUp, Map, SimCard, Wifi, User, BookOpen } from 'lucide-react';

// Mock Data
const COUNTRIES = [
  { id: '1', name: 'Cuba', flag: '🇨🇺' },
  { id: '2', name: 'Cyprus', flag: '🇨🇾' },
  { id: '3', name: 'Iceland', flag: '🇮🇸' },
  { id: '4', name: 'Russia', flag: '🇷🇺' },
  { id: '5', name: 'Azerbaijan', flag: '🇦🇿' },
];

const REGIONS = [
  {
    id: 'africa',
    name: 'Africa',
    count: 20,
    countries: [
      'Algeria', 'Morocco', 'Nigeria', 'Cameroon', 'Algeria', 'Morocco', 'Nigeria', 'Cameroon', 'Algeria', 'Morocco',
      'Algeria', 'Morocco', 'Nigeria', 'Cameroon', 'Algeria', 'Morocco', 'Nigeria', 'Cameroon', 'Algeria', 'Cameroon',
      'Algeria', 'Morocco', 'Nigeria', 'Cameroon', 'Algeria', 'Morocco', 'Nigeria', 'Cameroon', 'Algeria', 'Cameroon',
    ]
  },
  {
    id: 'america',
    name: 'America',
    count: 5,
    countries: ['USA', 'Canada', 'Mexico', 'Brazil', 'Argentina']
  },
  {
    id: 'asia',
    name: 'Asia',
    count: 12,
    countries: ['China', 'Japan', 'India', 'Thailand', 'Vietnam']
  }
];

export default function App() {
  const [activeTab, setActiveTab] = useState('regional'); // Default to regional for preview
  const [expandedRegion, setExpandedRegion] = useState('africa');

  const toggleRegion = (id) => {
    setExpandedRegion(expandedRegion === id ? null : id);
  };

  return (
    <div className="min-h-screen bg-gray-50 font-sans text-slate-800 pb-20">
      {/* Header Section */}
      <div className="p-6 bg-white">
        {/* User Profile */}
        <div className="flex items-center gap-3 mb-6">
          <div className="w-12 h-12 rounded-full bg-orange-100 border-2 border-orange-200 flex items-center justify-center text-2xl overflow-hidden">
            <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=Felix" alt="User" className="w-full h-full" />
          </div>
          <span className="text-xl font-bold text-slate-800">Darío</span>
        </div>

        {/* Title */}
        <h1 className="text-2xl font-bold text-slate-900 mb-6 leading-tight">
          Where are you traveling next?
        </h1>

        {/* Search Bar */}
        <div className="relative mb-6">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 w-5 h-5" />
          <input
            type="text"
            placeholder="Search Your Destination"
            className="w-full pl-12 pr-4 py-4 bg-white border border-gray-200 rounded-xl focus:outline-none focus:border-orange-500 text-gray-600"
          />
        </div>

        {/* Toggle Switch */}
        <div className="flex bg-white rounded-xl border border-gray-200 p-1 mb-2">
          <button
            onClick={() => setActiveTab('countries')}
            className={`flex-1 py-3 rounded-lg text-sm font-semibold transition-colors ${
              activeTab === 'countries'
                ? 'bg-[#EA4C36] text-white'
                : 'bg-transparent text-gray-500 hover:bg-gray-50'
            }`}
          >
            Countries
          </button>
          <button
            onClick={() => setActiveTab('regional')}
            className={`flex-1 py-3 rounded-lg text-sm font-semibold transition-colors ${
              activeTab === 'regional'
                ? 'bg-[#EA4C36] text-white'
                : 'bg-transparent text-gray-500 hover:bg-gray-50'
            }`}
          >
            Regional plans
          </button>
        </div>
      </div>

      {/* Content Area */}
      <div className="px-6 pb-6">
        {activeTab === 'countries' ? (
          <div className="space-y-3">
            {COUNTRIES.map((country) => (
              <div key={country.id} className="bg-white p-4 rounded-2xl border border-gray-100 shadow-sm flex items-center gap-4">
                <div className="w-10 h-10 rounded-full bg-gray-50 flex items-center justify-center text-2xl">
                  {country.flag}
                </div>
                <span className="font-medium text-slate-800">{country.name}</span>
              </div>
            ))}
          </div>
        ) : (
          <div className="space-y-4">
            {REGIONS.map((region) => (
              <div 
                key={region.id} 
                className="bg-white rounded-3xl border border-gray-100 shadow-[0_4px_20px_rgba(0,0,0,0.03)] overflow-hidden transition-all duration-300"
              >
                <button
                  onClick={() => toggleRegion(region.id)}
                  className="w-full p-5 flex items-center justify-between bg-white"
                >
                  <div className="flex items-center gap-4">
                    <div className="w-12 h-12 rounded-full bg-cyan-50 flex items-center justify-center text-cyan-600">
                      <Globe className="w-7 h-7" />
                    </div>
                    <div className="text-left">
                      <span className="block text-lg font-medium text-slate-800">
                        {region.name} {region.count > 0 && <span className="text-slate-500 text-base">({region.count} countries)</span>}
                      </span>
                    </div>
                  </div>
                  <div className={`w-10 h-10 rounded-full flex items-center justify-center transition-colors ${
                    expandedRegion === region.id ? 'bg-green-300' : 'bg-green-100'
                  }`}>
                    {expandedRegion === region.id ? (
                      <ChevronUp className="w-6 h-6 text-white" />
                    ) : (
                      <ChevronDown className="w-6 h-6 text-white" />
                    )}
                  </div>
                </button>

                {/* Expanded Content */}
                {expandedRegion === region.id && (
                  <div className="px-8 pb-8 pt-2">
                    <div className="grid grid-cols-3 gap-x-4 gap-y-3">
                      {region.countries.map((country, idx) => (
                        <div key={idx} className="flex items-center gap-2">
                          <span className="text-[10px] font-bold text-slate-800 w-4">{idx + 1}.</span>
                          <span className="text-[10px] font-bold text-slate-700 truncate">{country}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Bottom Navigation */}
      <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-100 px-6 py-4 flex justify-between items-center z-10">
        <button className="text-[#EA4C36]"><Globe className="w-6 h-6" /></button>
        <button className="text-gray-400"><BookOpen className="w-6 h-6" /></button>
        <button className="text-gray-400"><SimCard className="w-6 h-6" /></button>
        <button className="text-gray-400"><Wifi className="w-6 h-6" /></button>
        <button className="text-gray-400"><User className="w-6 h-6" /></button>
      </div>
    </div>
  );
}
