From: Madhvapathi Sriram <Madhvapathi.Sriram@csr.com>
Subject: s3c64xx : RTC alarm wakeup
Date: Wed, 21 Mar 2012 11:57:58 +0000
Message-ID: <AAD401B65941D44692B7183E657718080358B7D5@banasiexm01.ASIA.ROOT.PRI>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cluster-g.mailcontrol.com ([208.87.233.190]:56988 "EHLO
	cluster-g.mailcontrol.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751321Ab2CUL6o convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Mar 2012 07:58:44 -0400
Received: from banasiexc01.ASIA.ROOT.PRI ([202.80.51.114])
	by rly33g.srv.mailcontrol.com (MailControl) with ESMTP id q2LBtNac031128
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Mar 2012 11:58:42 GMT
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'linux-samsung-soc@vger.kernel.org'" <linux-samsung-soc@vger.kernel.org>

Hi,

I am trying to use RTC alarm for wakeup on s3c6410.

I could verify that the RTC gives an alarm interrupt, without putting the CPU to sleep.
However, when I set the RTC alarm at some future time and put the CPU to sleep (RTC configured for ALARMINT), the CPU does not resume.
Are there any problems with the RTC wakeup on s3c6410? Or am I missing something?

Does anyone know about this problem?


Regards,
Madhvapathi Sriram



Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
More information can be found at www.csr.com. Follow CSR on Twitter at http://twitter.com/CSR_PLC and read our blog at www.csr.com/blog
