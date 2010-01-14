From: Ben Dooks <ben-linux@fluff.org>
Subject: identifying s5p based devices
Date: Thu, 14 Jan 2010 07:01:32 +0000
Message-ID: <20100114070132.GS3738@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:50274 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751664Ab0ANHBg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2010 02:01:36 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NVJi0-00026n-Mi
	for linux-samsung-soc@vger.kernel.org; Thu, 14 Jan 2010 07:01:32 +0000
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

After thinking about previous discussions with Samsng SystemLSI group
about the newer SoC and lack of continuty in the placement of the device
identification register I was thinking the following:

Woud it be possible to probe each possible ID register location to see
if there is a valid identity there and stop once a valid one is read?

IE:
	void __iomem *idplaces = {
	     ...
	     ....
	}

	...	

	for (r in idplaces) {
	    id = __raw_readl(r);
	    cpu = cpu_find(r);
	    if (cpu) {
	       print_cpu_id(cpu);
	       break;
	    }
	}

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
