From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: Re: [PATCHv2 1/3] phy: Add exynos-simple-phy driver
Date: Wed, 07 May 2014 15:36:53 +0200
Message-ID: <536A36F5.5080303@samsung.com>
References: <1396967856-27470-1-git-send-email-t.stanislaws@samsung.com>
 <1396967856-27470-2-git-send-email-t.stanislaws@samsung.com>
 <534506B1.4040908@samsung.com>
 <CAPdUM4M109_kzY6cUMJQPSwgazvWmNDWL1JeXgiqnzvH8dhK2Q@mail.gmail.com>
 <53451A60.4050803@samsung.com> <53675D72.70103@ti.com>
 <CAPdUM4N+2VXpiFSiWW9gKfbte1zkpDbCOSF+KvEo4T1KLqqwjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAPdUM4N+2VXpiFSiWW9gKfbte1zkpDbCOSF+KvEo4T1KLqqwjw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, sunil joshi <joshi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Grant Likely <grant.likely@linaro.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/07/2014 12:38 PM, Rahul Sharma wrote:
> On 5 May 2014 15:14, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>> Hi,
>>
>> On Wednesday 09 April 2014 03:31 PM, Sylwester Nawrocki wrote:
>>> Hi,
>>>
>>> On 09/04/14 11:12, Rahul Sharma wrote:
>>>> Idea looks good. How about keeping compatible which is independent
>>>> of SoC, something like "samsung,exynos-simple-phy" and provide Reg
>>>> and Bit through phy provider node. This way we can avoid SoC specific
>>>> hardcoding in phy driver and don't need to look into dt bindings for
>>>> each new SoC.
>>>
>>> I believe it is a not recommended approach.
>>
>> Why not? We should try to avoid hard coding in the driver code. Moreover by
>> avoiding hardcoding we can make it a generic driver for single bit PHYs.
>>
> 
> +1.
> 
> @Tomasz, any plans to consider this approach for simple phy driver?
> 
> Regards,
> Rahul Sharma.
> 

Hi Rahul,
Initially, I wanted to make a very generic driver and to add bit and
register (or its offset) attribute to the PHY node.
However, there was a very strong opposition from DT maintainers
to adding any bit related configuration to DT.
The current solution was designed to be a trade-off between
being generic and being accepted :).

Regards,
Tomasz Stanislawski



>> Cheers
>> Kishon
> 
