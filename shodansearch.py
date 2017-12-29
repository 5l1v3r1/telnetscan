import shodan
import sys
SHODAN_API_KEY = "your shodan api here"
api = shodan.Shodan(SHODAN_API_KEY)
try:

	results = api.search(sys.argv[1:])
	for result in results['matches']:
		print '%s' % result['ip_str']

except shodan.APIError, e:
	print 'Error: %s' % e
