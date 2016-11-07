From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH RESEND] phy: exynos-mipi-video: simplify check for coupled
 phy status
Date: Mon, 7 Nov 2016 15:50:33 -0300
Message-ID: <2d8a48d1-2ecf-ad27-1e5a-a4233612c602@osg.samsung.com>
References: <CGME20161107104844eucas1p2b5571119dff76e33d6ec038c359224f7@eucas1p2.samsung.com>
 <1478515712-650-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478515712-650-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 11/07/2016 07:48 AM, Marek Szyprowski wrote:
> There is no need to access regmap of coupled phy to check its state - such
> information is already in the phy device itself, so use it directly. This
> let us to avoid possible access to registers of the device in the disabled
> power domain if the coupled phy is already disabled.
>

Do you think this patch needs also go to stable?

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
