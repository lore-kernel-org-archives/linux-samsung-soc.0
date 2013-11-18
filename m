From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: move firmware_ops to drivers/firmware
Date: Mon, 18 Nov 2013 10:00:32 -0700
Message-ID: <528A47B0.1090800@wwwdotorg.org>
References: <1384678169-28228-1-git-send-email-acourbot@nvidia.com> <CAHkRjk5LBOFx3ir49RgEsaFwvp5UCpTjYFWto+URXebAsOP0RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:41425 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079Ab3KRRAh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Nov 2013 12:00:37 -0500
In-Reply-To: <CAHkRjk5LBOFx3ir49RgEsaFwvp5UCpTjYFWto+URXebAsOP0RA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>, Alexandre Courbot <gnurou@gmail.com>, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 11/17/2013 08:59 AM, Catalin Marinas wrote:
> On 17 November 2013 08:49, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> The ARM tree includes a firmware_ops interface that is designed to
>> implement support for simple, TrustZone-based firmwares but could
>> also cover other use-cases. It has been suggested that this
>> interface might be useful to other architectures (e.g. arm64) and
>> that it should be moved out of arch/arm.
> 
> NAK. I'm for code sharing with arm via common locations but this API
> goes against the ARMv8 firmware standardisation efforts like PSCI,
> encouraging each platform to define there own non-standard interface.

Surely PSCI is *an* implementation of firmware_ops?

Couldn't firmware_ops be relevant to non-ARM architectures too? If so,
that would support my previous point; we're presumably not requiring
non-ARM architectures to implement PSCI?

On a practical note, unless ARM mandates by ARM architecture licensing
condition that mechanisms other than PSCI are not allowed, then they're
going to exist even if the upstream Linux community doesn't like it.
History has certainly shown that.
