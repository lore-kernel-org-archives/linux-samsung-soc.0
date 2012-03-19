From: Madhvapathi Sriram <Madhvapathi.Sriram@csr.com>
Subject: s3c64xx wake up question
Date: Mon, 19 Mar 2012 10:12:48 +0000
Message-ID: <AAD401B65941D44692B7183E657718080357CFDA@banasiexm01.ASIA.ROOT.PRI>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cluster-g.mailcontrol.com ([208.87.233.190]:55160 "EHLO
	cluster-g.mailcontrol.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753349Ab2CSK4e convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Mar 2012 06:56:34 -0400
Received: from banasiexc01.ASIA.ROOT.PRI ([202.80.51.114])
	by rly12g.srv.mailcontrol.com (MailControl) with ESMTP id q2JAColQ024873
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Mar 2012 10:12:54 GMT
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'linux-samsung-soc@vger.kernel.org'" <linux-samsung-soc@vger.kernel.org>

Hi,

I am trying to get wake-up from IDLE and SLEEP working on my board based on S3C6410.

The problem I see is that once the CPU goes to SLEEP or IDLE state, it does not wake up despite configuring activity on Keypad.
I have verified the following:
1. VDD_ALIVE is powered up @1.2V
2. Dumped EINT_MASK and EINT0_MASK - reset with 0 (enable) for almost all the sources.
3. PWR_CFG is configured to be woken up for all sources (HSMMCx, RTC, KEYPAD etc)

So, not sure if have something else to verify or check.

I hope someone could provide some pointers on the problem.

Regards,
Madhvapathi Sriram




Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
More information can be found at www.csr.com. Follow CSR on Twitter at http://twitter.com/CSR_PLC and read our blog at www.csr.com/blog
