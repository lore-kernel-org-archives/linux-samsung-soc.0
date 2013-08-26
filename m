From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [RFC] cleanup mach-s5p*
Date: Mon, 26 Aug 2013 09:52:47 +0900
Message-ID: <1f7b01cea1f6$9560aa10$c021fe30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11876 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754624Ab3HZAwv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Aug 2013 20:52:51 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS4004B350U23F0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Aug 2013 09:52:49 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, =?ks_c_5601-1987?B?VG9tYXN6IEZpZ2EvU1JQT0wtS2VybmVsICYgU3lzdGVtIA==?= =?ks_c_5601-1987?B?RnJhbWV3b3JrIChTU0QpLy4vu++8usD8wNo=?= <t.figa@samsung.com>, =?ks_c_5601-1987?B?U3lsd2VzdGVyIE5hd3JvY2tpL1NSUE9MLUtlcm5lbCAmIA==?= =?ks_c_5601-1987?B?U3lzdGVtIEZyYW1ld29yayAoU1NEKS8uL7vvvLrA/MDa?= <s.nawrocki@samsung.com>, =?ks_c_5601-1987?B?TWFyZWsgU3p5cHJvd3NraS9TUlBPTC1LZXJuZWwgJiBTeQ==?= =?ks_c_5601-1987?B?c3RlbSBGcmFtZXdvcmsgKFNTRCkvLi+777y6wPzA2g==?= <m.szyprowski@samsung.com>

Hi all,

I have a plan to remove supporting following SoCs in mainline in the near
future.
- s5pc100 - smdkc100
- s5pv210(s5c110) - aquial, goni, smdkc110, smdkv210, torbreck
- s5p64x0(s5p6440, s5p6450)- smdk6440, smdk6450

I think users don't seem to use that any more with mainline. If so, we are
able to consider, it is not right now though.

How do you think?

- Kukjin
