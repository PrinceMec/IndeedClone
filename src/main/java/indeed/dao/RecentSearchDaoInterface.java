package indeed.dao;

import java.util.List;


import indeed.model.RecentSearch;

public interface RecentSearchDaoInterface {
	
	public void saveSearch(RecentSearch recentSearch);
	
	public List<RecentSearch> getAllSearches(int jobSeekerId); 
}
