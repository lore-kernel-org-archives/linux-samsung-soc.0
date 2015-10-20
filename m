From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 04/10] dt-bindings: video: add PCLK clock entry to
 exynos5433-decon
Date: Tue, 20 Oct 2015 14:50:44 +0200
Message-ID: <562638A4.8090303@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
 <1445332961-25419-5-git-send-email-a.hajda@samsung.com>
 <5626327E.3050002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <5626327E.3050002@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, k.kozlowski.k@gmail.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 20/10/15 14:24, Krzysztof Kozlowski wrote:
> W dniu 20.10.2015 o 18:22, Andrzej Hajda pisze:
>> > DECON IP requires this clock to access configuration registers.
>> > 
>> > Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> > ---
>> >  Documentation/devicetree/bindings/video/exynos5433-decon.txt | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > 
>> > diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> > index 377afbf..3dff78b 100644
>> > --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> > +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> > @@ -16,7 +16,7 @@ Required properties:
>> >  - clocks: must include clock specifiers corresponding to entries in the
>> >  	  clock-names property.
>> >  - clock-names: list of clock names sorted in the same order as the clocks
>> > -	       property. Must contain "aclk_decon", "aclk_smmu_decon0x",
>> > +	       property. Must contain "pclk", "aclk_decon", "aclk_smmu_decon0x",
>
> I assume that old DTB wouldn't work at all, so there is no point in
> maintaining ABI compatibility?

As you know there is no single exynos5433 board dts that would use
the DECON IP block in mainline yet. I doubt anyone at this point
in mainline cares whether we require this additional clock or not.

-- 
Thanks,
Sylwester
