From: Madhvapathi Sriram <Madhvapathi.Sriram@csr.com>
Subject: Suspend/Resume issues on s3c6410
Date: Thu, 22 Mar 2012 12:02:41 +0000
Message-ID: <AAD401B65941D44692B7183E6577180803590E84@banasiexm01.ASIA.ROOT.PRI>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cluster-g.mailcontrol.com ([208.87.233.190]:34427 "EHLO
	cluster-g.mailcontrol.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932152Ab2CVMDT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Mar 2012 08:03:19 -0400
Received: from banasiexc02.ASIA.ROOT.PRI ([202.80.51.114])
	by rly17g.srv.mailcontrol.com (MailControl) with ESMTP id q2MC2DS8005205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Mar 2012 12:03:15 GMT
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'linux-samsung-soc@vger.kernel.org'" <linux-samsung-soc@vger.kernel.org>

Hi,

I have been trying to get past the un-resume-able state of the s3c6410 on my board, but to no avail.
I have been trying various things:
1. Trying to get it through the EINT sources (GPN4 through 11) but the CPU just does not wake up.
2. Trying to get it through the RTC (which was an arduous task - the driver had to go through changes for IRQs registering etc,  and then I found them on the post too) but looks like RTC cannot wake up the CPU

Posting at [1] and [2] yielded no results.
However, looking at [3] gives me an impression that things are pretty much ok on 6410. The board specific issues could be present.
Anyone has an idea as to what should I look into? - I am very new to S3c6410 and would need some pointers. BTW I am using a pretty old kernel version -2.6.35.

[1] http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg10070.html
[2] http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg10050.html
[3] http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg00960.html

Thanks in advance for any pointers.

Regards,
Madhvapathi Sriram




Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
More information can be found at www.csr.com. Follow CSR on Twitter at http://twitter.com/CSR_PLC and read our blog at www.csr.com/blog
