From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: sound: Convert Samsung Exynos5433 TM2(E)
 audio complex with WM5110 codec to dt-schema
Date: Thu, 26 Sep 2019 15:54:47 +0200
Message-ID: <20190926135447.GA15983@pi3>
References: <CGME20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4@eucas1p1.samsung.com>
 <20190926120210.8544-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190926120210.8544-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Maciej Falkowski <m.falkowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 26, 2019 at 02:02:10PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to
> newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added type and description and removed number of items from 'model' property.

Thanks for the changes. However still you have non-standard properties
put in random order. Argument that the order follows example-schema is
not correct. These are not standard properties.

Best regards,
Krzysztof
