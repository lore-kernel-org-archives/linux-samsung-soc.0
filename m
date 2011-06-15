From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Wed, 15 Jun 2011 11:43:38 +0200
Message-ID: <000a01cc2b40$b4559270$1d00b750$%szyprowski@samsung.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
 <1307693723-14971-4-git-send-email-anand.kn@samsung.com>
 <4DF39A92.5050609@gmail.com>
 <BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com>
 <4DF866D9.7090406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17599 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754435Ab1FOJoN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 05:44:13 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LMT00963SDN6X80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 Jun 2011 10:44:11 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMT00D4OSDM37@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 Jun 2011 10:44:10 +0100 (BST)
In-reply-to: <4DF866D9.7090406@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: 'Sylwester Nawrocki' <snjw23@gmail.com>, 'Anand Kumar N' <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, linux@arm.linux.org.uk

Hello,

On Wednesday, June 15, 2011 10:01 AM Sylwester Nawrocki wrote:

(snipped)

> > Sorry, I am not quite sure if I understand the problem here. For
> > instance, all Samsung SoC's and each instance of i2c device in a SoC,
> > use the same con_id for the i2c 'struct clock' instance. The con_id is
> > 'i2c'. The i2c driver uses the con_id 'i2c' to lookup the 'struct
> > clock' instance and it works for all Samsung SoC's and all instances
> > of i2c device in the SoC.
> >
> > Is your point different than what I understand? Please help.
> 
> I appreciate your efforts in converting all Samsung platforms to clkdev.
> 
> With the above I2C example I was trying to illustrate the additional
> level of indirection that is present in case of OMAP clock mappings,
> comparing to your implementation.
> As long as IP clock names are same among various SoC there is no issue
> at all with your clk lookup approach.
> But this is already not the case with LCD controller IP.
> On S3C series the IP bus clock name is "lcd" while on S5P series it's
> "fimd".
> There is a common framebuffer driver for S3C and S5P SoCs.
> It just does not look right to me to be adding in the driver switch/case
> for the clock names. I thought clkdev is meant to resolve such differences.
> 
> Then how it would be possible to map those clocks into single con_id with
> your patches? E.g.
> 
> S3C clk | S5P  clk | con_id
> ---------------------------
>  "lcd"  | "fimd"   | "lcd" ?
> 
> I believe there will come more differences like that in the future.

Actually the problem is rather theoretical one. AFAIR in the old days the
s3c-fb driver initially got merged with 'lcd' clock name for unknown reasons.
The documentation always used 'fimd' name, even for S3C case. However, it
was easier to rename 'fimd' clock name to 'lcd' in the platform code (for
s5pc110 and s5pv210) than to get patches merged to unmaintained framebuffer
subsystem to get it renamed to 'fimd' in the driver.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
