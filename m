From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2] arm: plat-samsung: check processor type before
	cache restoration in resume
Date: Tue, 26 Feb 2013 11:22:01 +0000
Message-ID: <20130226112201.GR17833@n2100.arm.linux.org.uk>
References: <1361872613-12040-1-git-send-email-inderpal.singh@linaro.org> <20130226100222.GQ17833@n2100.arm.linux.org.uk> <CAG17yqRS2MxTxgVD0qx73BO0x8PWgCmqrQQ4+rDvP=MwMKj3qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:50152 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753091Ab3BZLWJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 06:22:09 -0500
Content-Disposition: inline
In-Reply-To: <CAG17yqRS2MxTxgVD0qx73BO0x8PWgCmqrQQ4+rDvP=MwMKj3qw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inderpal Singh <inderpal.singh@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org

On Tue, Feb 26, 2013 at 04:46:01PM +0530, Inderpal Singh wrote:
> On 26 February 2013 15:32, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Tue, Feb 26, 2013 at 03:26:53PM +0530, Inderpal Singh wrote:
> >> Only cortex-a9 based samsung platforms have l2x0 cache controller. Hence check
> >> the same before restoring the cache in resume.
> >
> > Why is this patch soo complicated?  Can't you read the CPUs MIDR register
> > from assembly code?
> 
> I wanted to read MIDR only once thats why didn't read in resume
> function in assembly as the same resume function gets used in cpuidle
> path.

It's more expensive to load it from memory than to read it from CP15.
