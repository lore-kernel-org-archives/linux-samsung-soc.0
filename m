From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: Re: [PATCHv2 2/3] drm: exynos: hdmi: use hdmiphy as PHY
Date: Wed, 09 Apr 2014 13:05:04 +0200
Message-ID: <53452960.5070501@samsung.com>
References: <1396967856-27470-1-git-send-email-t.stanislaws@samsung.com>
 <1396967856-27470-3-git-send-email-t.stanislaws@samsung.com>
 <53452157.9030203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53452157.9030203@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, kishon@ti.com, kyungmin.park@samsung.com, robh+dt@kernel.org, grant.likely@linaro.org, sylvester.nawrocki@gmail.com, rahul.sharma@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,
This issue could be solved by exporting a regmap from PMU driver
or Exynos clock provider for the usage by exynos-simple-phy.
The operations on PHYs from exynos-simple-phy provider would
be chained to PMU driver and protected by a spinlock in the regmap.

Luckily, the divider is not used as far as I know.

Regards,
Tomasz Stanislawski

On 04/09/2014 12:30 PM, Andrzej Hajda wrote:
> Hi Tomasz,
> 
> On 04/08/2014 04:37 PM, Tomasz Stanislawski wrote:
>> The HDMIPHY (physical interface) is controlled by a single
>> bit in a power controller's regiter. It was implemented
>> as clock. It was a simple but effective hack.
> 
> This power controller register has also bits to control HDMI clock
> divider ratio. I guess current drivers do not change it, but how do you
> want to implement access to it if some HDMI driver in the future will
> need to change ratio. I guess in case of clk it would be easier.
> 
> Regards
> Andrzej
> 
> 
