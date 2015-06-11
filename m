From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] irqchip: exynos-combiner: Save IRQ enable set on
 suspend
Date: Thu, 11 Jun 2015 08:46:02 +0200
Message-ID: <55792EAA.1030309@collabora.co.uk>
References: <1433941831-16637-1-git-send-email-javier.martinez@collabora.co.uk> <84ioavb2j9.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:51871 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782AbbFKGqI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 02:46:08 -0400
In-Reply-To: <84ioavb2j9.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hello Peter,

On 06/11/2015 12:51 AM, Peter Chubb wrote:
>>>>>> "Javier" == Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
> 
> Javier> The Exynos interrupt combiner IP looses its state when the SoC
> 	    	   	     	         s/looses/loses/
>

Thanks for pointing out the typo, I'll fix it on the next version.
 
> Peter C
>

Best regards,
Javier
 
