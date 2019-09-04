From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 3/8] drivers: memory: extend of_memory by LPDDR3
 support
Date: Wed, 4 Sep 2019 20:31:14 +0200
Message-ID: <20190904183114.GB12918@kozik-lap>
References: <20190821104303.32079-1-l.luba@partner.samsung.com>
 <CGME20190821104320eucas1p10c911c2ce59007bcf6c039f52b869656@eucas1p1.samsung.com>
 <20190821104303.32079-4-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821104303.32079-4-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 12:42:58PM +0200, Lukasz Luba wrote:
> The patch adds AC timings information needed to support LPDDR3 and memory
> controllers. The structure is used in of_memory and currently in Exynos
> 5422 DMC. Add parsing data needed for LPDDR3 support.

Thanks, applied, with commit msg fixes.

Please do not write "This patch" (submitting patches mentions preferred
format). Also at this point, this is not "used currently in Exynos 5422
DMC" because there is no such driver. Just say that it is necessary for
upcoming DMC driver.

Best regards,
Krzysztof
