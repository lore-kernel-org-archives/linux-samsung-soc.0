From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: Re: [PATCHv2 1/3] phy: Add exynos-simple-phy driver
Date: Wed, 09 Apr 2014 13:14:31 +0200
Message-ID: <53452B97.8020700@samsung.com>
References: <1396967856-27470-1-git-send-email-t.stanislaws@samsung.com>
 <1396967856-27470-2-git-send-email-t.stanislaws@samsung.com>
 <534506B1.4040908@samsung.com>
 <CAPdUM4M109_kzY6cUMJQPSwgazvWmNDWL1JeXgiqnzvH8dhK2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAPdUM4M109_kzY6cUMJQPSwgazvWmNDWL1JeXgiqnzvH8dhK2Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <r.sh.open@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kishon Vijay Abraham I <kishon@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rahul,

On 04/09/2014 11:12 AM, Rahul Sharma wrote:
> Hi Tomasz,
> 
> On 9 April 2014 14:07, Andrzej Hajda <a.hajda@samsung.com> wrote:
>> Hi Tomasz,
>>
>> On 04/08/2014 04:37 PM, Tomasz Stanislawski wrote:
>>> Add exynos-simple-phy driver to support a single register
>>> PHY interfaces present on Exynos4 SoC.
>>>
>>> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>

[snip]

>>> +
>>> +     regs = devm_ioremap(dev, res->start, res->end - res->start);
>>> +     if (!regs) {
>>> +             dev_err(dev, "failed to ioremap registers\n");
>>> +             return -EFAULT;
>>> +     }
>>
>> Why not devm_ioremap_resource? If not, resource_size function calculates
>> length of resource correctly.
>>
>> Anyway I like the idea of implementing multiple phys in one driver.
>> The only drawback I see is that some phys will be created even there are
>> no consumers for them. To avoid such situation you can try to use
>> lazy approach - create phy only if there is request for it,
>> exynos_phy_xlate callback should allow this.
>>
>> Regards
>> Andrzej
>>
> 
> Idea looks good. How about keeping compatible which is independent
> of SoC, something like "samsung,exynos-simple-phy" and provide Reg
> and Bit through phy provider node. This way we can avoid SoC specific
> hardcoding in phy driver and don't need to look into dt bindings for
> each new SoC.

A very nice idea BUT there is a very strong pressure from DT guys
to avoid adding any bit fields/offsets/masks in DT nodes.

Hopefully, as long as driver name starts with "exynos-" prefix
one can hide SoCs specific tricks deep inside driver code.

The idea behind this driver was not to create a generic phy for 1-bit
devices but rather to hide SoC-specific issues from client drivers
like DRM-HDMI.

> 
> We can use syscon interface to access PMU bits like USB phy.
> PMU is already registered as system controller
> 

Ok. I will try to use it in PATCHv3.

> Regards,
> Rahul Sharma.
> 

Regards,
Tomasz Stanislawski
