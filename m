From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Fix up IRQ mapping for balblair on
	Cragganmore
Date: Fri, 2 Nov 2012 13:02:02 +0000
Message-ID: <20121102130202.GA21340@opensource.wolfsonmicro.com>
References: <1351852733-3346-1-git-send-email-dp@opensource.wolfsonmicro.com> <5093B962.1060903@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56802 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752477Ab2KBNCG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Nov 2012 09:02:06 -0400
Content-Disposition: inline
In-Reply-To: <5093B962.1060903@mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

On Fri, Nov 02, 2012 at 04:15:30PM +0400, Sergei Shtylyov wrote:
> Hello.
>
> On 02-11-2012 14:38, Dimitris Papastamos wrote:
>
>> We are using S3C_EINT(4) instead of S3C_EINT(5).
>
>> Change-Id: Ia197069ddc736813f2711c763469eaf655ea58ac
>
>    Remove this line please -- it has no place in the upstream patch.
>
>> Signed-off-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
>
> WBR, Sergei
>

Oops, thanks for catching that.
