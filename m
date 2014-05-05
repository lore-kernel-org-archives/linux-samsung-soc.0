From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCHv2 1/3] phy: Add exynos-simple-phy driver
Date: Mon, 5 May 2014 15:14:18 +0530
Message-ID: <53675D72.70103@ti.com>
References: <1396967856-27470-1-git-send-email-t.stanislaws@samsung.com> <1396967856-27470-2-git-send-email-t.stanislaws@samsung.com> <534506B1.4040908@samsung.com> <CAPdUM4M109_kzY6cUMJQPSwgazvWmNDWL1JeXgiqnzvH8dhK2Q@mail.gmail.com> <53451A60.4050803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53451A60.4050803@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>, sunil joshi <joshi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wednesday 09 April 2014 03:31 PM, Sylwester Nawrocki wrote:
> Hi,
> 
> On 09/04/14 11:12, Rahul Sharma wrote:
>> Idea looks good. How about keeping compatible which is independent
>> of SoC, something like "samsung,exynos-simple-phy" and provide Reg
>> and Bit through phy provider node. This way we can avoid SoC specific
>> hardcoding in phy driver and don't need to look into dt bindings for
>> each new SoC.
> 
> I believe it is a not recommended approach.

Why not? We should try to avoid hard coding in the driver code. Moreover by
avoiding hardcoding we can make it a generic driver for single bit PHYs.

Cheers
Kishon
