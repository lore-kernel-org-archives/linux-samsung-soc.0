From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] phy: exynos-mipi-video: simplify check for coupled phy
 status
Date: Tue, 02 Aug 2016 11:07:10 +0200
Message-ID: <57A062BE.9080609@samsung.com>
References: <1470127956-22476-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1470127956-22476-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/02/2016 10:52 AM, Marek Szyprowski wrote:
> There is no need to access regmap of coupled phy to check its state - such
> information is already in the phy device itself, so use it directly. This
> let us to avoid possible access to registers of the device in the disabled
> power domain if the coupled phy is already disabled.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
