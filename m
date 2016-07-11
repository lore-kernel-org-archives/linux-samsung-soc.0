From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] mfd: Add DT bindings documentation for Samsung
 Exynos LPASS
Date: Mon, 11 Jul 2016 09:32:34 -0500
Message-ID: <20160711143234.GA7163@rob-hp-laptop>
References: <1467738785-31410-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f175.google.com ([209.85.161.175]:33130 "EHLO
	mail-yw0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751669AbcGKOcj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jul 2016 10:32:39 -0400
Content-Disposition: inline
In-Reply-To: <1467738785-31410-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: lee.jones@linaro.org, broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 05, 2016 at 07:13:05PM +0200, Sylwester Nawrocki wrote:
> This patch adds documentation of the DT bindings for the Samsung
> Exynos SoC Low Power Audio Subsystem.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> 
> There were few rather significant additions since v3 and I had to drop tags:
>  Acked-by: Rob Herring <robh@kernel.org>
>  Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Changes since v3:
>  - moved to Documentation/devicetree/bindings/mfd,
>  - added #address-cells, #size-cells, ranges as required
>    properties,
>  - added description of the IP block subnodes and links
>    to their binding's documentation.
> 
> Changes since v2:
>  - none.
> ---
>  .../bindings/mfd/samsung,exynos5433-lpass.txt       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt

Acked-by: Rob Herring <robh@kernel.org>
