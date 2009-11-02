From: Harald Welte <laforge@gnumonks.org>
Subject: Ben Dooks' git tree location
Date: Mon, 2 Nov 2009 16:05:37 +0900
Message-ID: <20091102070537.GG4170@prithivi.gnumonks.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52367 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753896AbZKBHHX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 02:07:23 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaswinder Brar <jassi.brar@samsung.com>, linux-samsung-soc@vger.kernel.org

Hi all!

As Ben has announced some time ago, and some folks like Jassi have noted:

Ben's s3c-linux git tree has moved its location some time ago.

you can find a gitweb interface at
	http://git.fluff.org/gitweb?p=bjdooks/linux.git;a=summary

you can clone it from the following URL:
	git clone git://git.fluff.org/bjdooks/linux.git

I don't know if there is any http URL available.  In any case,
even from inside Samsung, you can use the socat based method
to access a git:// style URL, as per instructions from:
http://www.emilsit.net/blog/archives/how-to-use-the-git-protocol-through-a-http-connect-proxy/

Regards,
	Harald
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
