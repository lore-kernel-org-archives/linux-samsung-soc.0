From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/1] ARM: dts: Use more descriptive names for Exynos5420
 PDs
Date: Fri, 06 Feb 2015 22:09:36 +0300
Message-ID: <54D51170.10903@cogentembedded.com>
References: <1423244258-24314-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423244258-24314-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello.

On 02/06/2015 08:37 PM, Javier Martinez Canillas wrote:

> All the device nodes for the Exynos5420 power-domains have a quite
> generic "power-domain" name.

    And this is in conformance to the ePAPR standard.

> So in case of an error, the Exynos PD
> driver shows the following (not very useful) message:

> "Power domain power-domain disable failed"

    Why not fix the message instead to use the full device name?

> Use descriptive names to know on which PD enable or disable failed.

> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

WBR, Sergei
