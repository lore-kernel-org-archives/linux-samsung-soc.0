From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: remove the cd-gpios property for eMMC
 of odroid-xu3/4
Date: Wed, 23 Nov 2016 19:20:46 +0200
Message-ID: <20161123172046.GB4408@kozik-lap>
References: <20161121071032.10183-1-jh80.chung@samsung.com>
 <CGME20161121170629epcas3p4ef4f3b98d44d31f456d75c33715f6b4a@epcas3p4.samsung.com>
 <20161121170605.GA8181@kozik-lap>
 <9ecce088-b91d-d51a-5a19-33476961d2ea@samsung.com>
 <7e072e61-0a14-ebee-03ac-2eff4f029848@samsung.com>
 <00c4e163-98ed-fcc5-2248-22c697967032@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00c4e163-98ed-fcc5-2248-22c697967032@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, cw00.choi@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, m.szyprowski@samsung.com, jy0922.shim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Nov 22, 2016 at 05:19:30PM +0900, Jaehoon Chung wrote:
> On 11/22/2016 04:51 PM, Andrzej Hajda wrote:
> > On 22.11.2016 02:24, Jaehoon Chung wrote:
> >> On 11/22/2016 02:06 AM, Krzysztof Kozlowski wrote:
> >>> On Mon, Nov 21, 2016 at 04:10:32PM +0900, Jaehoon Chung wrote:
> >>>> Odroid-xu3/4 didn't need to use the cd-gpios for detecting card.
> >>>> Because Host controller has the CDETECT register through SDx_CDN line.
> >>>> Host controller can know whether card is inserted or not with this
> >>>> register.
> >>>>
> >>>> When i have checked the Odroid-xu3/4, they are using CDETECT register.
> >>>> (Not using exteranl cd-gpio.)
> >>> Makes sense. Just one question: the sd0_cd pinctrl setting should stay,
> >>> right?

Thanks, applied with removal of Fixes tag because commit description did
not mention any issue, error or wrong behavior to fix.

Best regards,
Krzysztof
