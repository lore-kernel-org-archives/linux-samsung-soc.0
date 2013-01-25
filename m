From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/6] ARM: dts: Add basic dts include files for Samsung
 S3C64xx SoCs
Date: Fri, 25 Jan 2013 11:15:48 -0800
Message-ID: <016c01cdfb30$64f80430$2ee80c90$@samsung.com>
References: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
 <20130114150531.GE21142@e102568-lin.cambridge.arm.com>
 <20130116105957.GA1963@linaro.org> <3747315.IyCCRDXgbD@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18618 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757234Ab3AYTQN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 14:16:13 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH7004HK46UMFG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 04:16:11 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH700H9K46VOKD0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 04:16:11 +0900 (KST)
In-reply-to: <3747315.IyCCRDXgbD@flatron>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Dave Martin' <dave.martin@linaro.org>
Cc: 'Lorenzo Pieralisi' <lorenzo.pieralisi@arm.com>, 'Mark Rutland' <Mark.Rutland@arm.com>, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, kwangwoo.lee@gmail.com, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, mcuelenaere@gmail.com, augulis.darius@gmail.com, linux-arm-kernel@lists.infradead.org

Tomasz Figa wrote:

[...]

> > Well, the number of CPU types does not grow rapidly.  It will be much
> > less than one per SoC -- so keeping the list up to date shouldn't be
> > that much effort.
> >
> > For ARM1176JZF-S, it could make sense for the comatible list to be
> >
> > 	"arm,arm1176jzf-s", "arm,arm1176"
> >
> > ...since the differences between 1176 variants are software probeable
> > (i.e., whether there is an FPU or not).  AFAIK the J, Z apply to all
> > ARM1176, and the -S (synthesisable RTL) is nothing to do with software.
> > The kernel probably only really needs to know "arm,arm1176".
> 
> OK. So the conclusion is that I should change the cpus node to following:
> 
>        cpus {
>                cpu {

cpu@0 { ?

>                        compatible = "arm,arm1176jzf-s", "arm,arm1176";
>                };
>        };
> 
> Am I right?
> 
I think so :-)

- Kukjin
