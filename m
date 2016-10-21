From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] dt-bindings: video: exynos7-decon: Remove obsolete
 samsung,power-domain property
Date: Fri, 21 Oct 2016 16:36:19 +0200
Message-ID: <7e80b5ee-41a9-8c35-ff0d-e1b8b7a4e429@samsung.com>
References: <CGME20161021140729eucas1p2db3ea45373ffa0490fb8b10bfa93ed74@eucas1p2.samsung.com>
 <1477058754-13866-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:36746 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933052AbcJUOg1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 10:36:27 -0400
In-reply-to: <1477058754-13866-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/21/2016 04:05 PM, Krzysztof Kozlowski wrote:
> The samsung,power-domain property is obsolete since commit 0da658704136
> ("ARM: dts: convert to generic power domain bindings for exynos DT").
> Replace it with generic one.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
