From: Harald Welte <laforge@gnumonks.org>
Subject: Samsung SoC / multimedia / allocating contiguous buffers
Date: Wed, 11 Nov 2009 16:28:08 +0900
Message-ID: <20091111072807.GZ4047@prithivi.gnumonks.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45132 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751316AbZKKH2X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2009 02:28:23 -0500
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.69)
	(envelope-from <laforge@gnumonks.org>)
	id 1N87cy-0005hg-Jz
	for linux-samsung-soc@vger.kernel.org; Wed, 11 Nov 2009 08:28:28 +0100
Received: from laforge by ideapad.de.gnumonks.org with local (Exim 4.69)
	(envelope-from <laforge@gnumonks.org>)
	id 1N87ce-0001sw-1n
	for linux-samsung-soc@vger.kernel.org; Wed, 11 Nov 2009 16:28:08 +0900
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Dear list,

I have sent a mail to the linux-media@vger.kernel.org mailing list,
outlining the need for an allocator for physically contiguous memory in
order to properly support the various multimedia IP cores inside the
samsung SoCs.

In case you are interested in this discussion, it is started at 
http://news.gmane.org/gmane.linux.drivers.video-input-infrastructure
and refers to an original proposal at
http://thread.gmane.org/gmane.linux.drivers.video-input-infrastructure/10204

Regards,
	Harald.
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
