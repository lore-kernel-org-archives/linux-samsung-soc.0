From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: Peach Pi/Pit boot failures in linux-next  (was Re: [RFC PATCH
 1/1] drm/exynos: Move platform drivers registration to module init)
Date: Mon, 24 Nov 2014 12:07:47 +0100
Message-ID: <54731183.7090307@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk> <7hh9xwxsev.fsf@deeprootsystems.com> <546CCAB8.9050402@collabora.co.uk> <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com> <7hppchsu29.fsf@deeprootsystems.com> <546E293D.9000300@collabora.co.uk> <7hbno1spdt.fsf@deeprootsystems.com> <546F3837.5020706@collabora.co.uk> <7hzjbko6eb.fsf@deeprootsystems.com> <546FA53D.2060807@collabora.co.uk> <547063C4.9030607@samsung.com> <5472FC7F.6090508@collabora.co.uk> <1416824001.5023.7.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:38093 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782AbaKXLHx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 06:07:53 -0500
In-Reply-To: <1416824001.5023.7.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Hello Krzysztof,

On 11/24/2014 11:13 AM, Krzysztof Kozlowski wrote:
>> Ok, please let me know if you need anything else from me.
> 
> Thanks! I replied before seeing your response. Anyway the dmatests are
> the same I got on Arndale Octa.
> 
> It seems that mau_epll has to be enabled... or something is wrong with
> clock hierarchy.
>

Another strange thing is that the problem does not happen for some people
using the same board, kernel and config options. For example Vivek and Ajay
report that they can't reproduce the issue on a Peach Pi using next-20141121
and exynos_defconfig without using clk_ignore_unused.

Best regards,
Javier
