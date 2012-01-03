From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [RFC][PATCH 0/4] lcd: platform-lcd: Add lcd panel and device
 tree support
Date: Tue, 03 Jan 2012 10:06:22 +0100
Message-ID: <4F02C50E.9030904@metafoo.de>
References: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On 01/02/2012 06:54 AM, Thomas Abraham wrote:
> The platform-lcd driver depends on platform-specific callbacks to setup the
> lcd panel. These callbacks are supplied using driver's platform data. But
> for adding device tree support for platform-lcd driver, providing such
> callbacks is not possible (without using auxdata).
> 
> Since the callbacks are usually lcd panel specific, it is possible to include
> the lcd panel specific setup and control functionality in the platform-lcd
> driver itself, thereby eliminating the need for supplying platform specific
> callbacks to the driver. The platform-lcd driver can include support for
> multiple lcd panels.
> 
> This patchset removes the need for platform data for platform-lcd driver and
> adds support which can be used to implement lcd panel specific functionality
> in the driver. As an example, the support for Hydis hv070wsa lcd panel is added
> to the platform-lcd driver which is then used on the Exynos4 based Origen board.
> This currently breaks build for other users of platform-lcd driver. Those can be
> fixed if this approach is acceptable.

The whole approach looks rather backwards to me. The exact purpose of the
platform_lcd driver is to redirect the lcd driver callbacks to board code.
So by removing this support you not only break all the existing driver but
also create a driver which does nothing. Then you add another layer of
abstraction to implement custom drivers in this driver. A better approach in
my opinion is to simply implement these drivers as first level LCD drivers.
So leave the platform-lcd driver as it is and just add a gpio (or maybe
regulator) lcd driver instead.

- Lars
