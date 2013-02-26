From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH v2] arm: plat-samsung: check processor type before cache
 restoration in resume
Date: Tue, 26 Feb 2013 16:46:01 +0530
Message-ID: <CAG17yqRS2MxTxgVD0qx73BO0x8PWgCmqrQQ4+rDvP=MwMKj3qw@mail.gmail.com>
References: <1361872613-12040-1-git-send-email-inderpal.singh@linaro.org>
	<20130226100222.GQ17833@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:57045 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751117Ab3BZLQC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 06:16:02 -0500
Received: by mail-we0-f173.google.com with SMTP id r5so3348642wey.32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Feb 2013 03:16:01 -0800 (PST)
In-Reply-To: <20130226100222.GQ17833@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org

On 26 February 2013 15:32, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Feb 26, 2013 at 03:26:53PM +0530, Inderpal Singh wrote:
>> Only cortex-a9 based samsung platforms have l2x0 cache controller. Hence check
>> the same before restoring the cache in resume.
>
> Why is this patch soo complicated?  Can't you read the CPUs MIDR register
> from assembly code?

I wanted to read MIDR only once thats why didn't read in resume
function in assembly as the same resume function gets used in cpuidle
path.

Regards,
Inder
