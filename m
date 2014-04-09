From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCHv2 1/3] phy: Add exynos-simple-phy driver
Date: Wed, 09 Apr 2014 12:01:04 +0200
Message-ID: <53451A60.4050803@samsung.com>
References: <1396967856-27470-1-git-send-email-t.stanislaws@samsung.com>
 <1396967856-27470-2-git-send-email-t.stanislaws@samsung.com>
 <534506B1.4040908@samsung.com>
 <CAPdUM4M109_kzY6cUMJQPSwgazvWmNDWL1JeXgiqnzvH8dhK2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <CAPdUM4M109_kzY6cUMJQPSwgazvWmNDWL1JeXgiqnzvH8dhK2Q@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>, sunil joshi <joshi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 09/04/14 11:12, Rahul Sharma wrote:
> Idea looks good. How about keeping compatible which is independent
> of SoC, something like "samsung,exynos-simple-phy" and provide Reg
> and Bit through phy provider node. This way we can avoid SoC specific
> hardcoding in phy driver and don't need to look into dt bindings for
> each new SoC.

I believe it is a not recommended approach.

> We can use syscon interface to access PMU bits like USB phy.
> PMU is already registered as system controller

Yes, that sounds good. This way we could avoid overlapping memory
mapped register regions specified in 'reg' properties in the device
tree.

-- 
Thanks,
Sylwester
