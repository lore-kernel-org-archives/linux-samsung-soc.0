From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] phy: core: document calibrate() method
Date: Mon, 22 Jul 2019 18:50:47 +0200
Message-ID: <6729fb28-29ef-a808-64b5-3eaaf7ac31e5@samsung.com>
References: <CGME20190719095254eucas1p29c9e6c7aac20cf89b589fd2f2036c485@eucas1p2.samsung.com>
        <20190719095245.17401-1-m.szyprowski@samsung.com>
        <085b8093-d7bc-d960-f0d8-8776818ebab0@ti.com>
        <1865da50-000f-e235-4090-1058d2aa217b@samsung.com>
        <6345ff36-9ee3-fe41-e416-a1178087b2c7@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6345ff36-9ee3-fe41-e416-a1178087b2c7@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kishon,

On 2019-07-19 14:25, Kishon Vijay Abraham I wrote:
> On 19/07/19 5:51 PM, Marek Szyprowski wrote:
>> On 2019-07-19 12:04, Kishon Vijay Abraham I wrote:
>>> On 19/07/19 3:22 PM, Marek Szyprowski wrote:
>>>> Commit 36914111e682 ("drivers: phy: add calibrate method") added support
>>>> for generic phy_calibrate() method, but it didn't explain in detail when
>>>> such method is supposed to be called. Add some more documentation directly
>>>> to the phy.h to make it clean that it is intended to be called after every
>>>> host controller reset.
>>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>>    include/linux/phy/phy.h | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>>>> index 15032f145063..46775e8b0ed9 100644
>>>> --- a/include/linux/phy/phy.h
>>>> +++ b/include/linux/phy/phy.h
>>>> @@ -101,6 +101,18 @@ struct phy_ops {
>>>>    	int	(*validate)(struct phy *phy, enum phy_mode mode, int submode,
>>>>    			    union phy_configure_opts *opts);
>>>>    	int	(*reset)(struct phy *phy);
>>>> +
>>>> +	/**
>>>> +	 * @calibrate:
>>>> +	 *
>>>> +	 * Optional.
>>>> +	 *
>>>> +	 * Used to calibrate phy, typically by adjusting some parameters
>>>> +	 * in runtime, which are otherwise lost after host controller
>>>> +	 * reset and cannot be set in phy_init() and phy_power_on().
>>>> +	 *
>>>> +	 * Returns: 0 if successful, an negative error code otherwise
>>>> +	 */
>>>>    	int	(*calibrate)(struct phy *phy);
>>> This should be added in drivers/phy/phy-core.c before phy_calibrate()?
>> Okay. Do you want to keep it also in phy.h (like for validate and
>> configure)?
> No. Adding in phy.txt and before phy_calibrate() should suffice IMO.

OKay, I will move it to phy.c. Generic PHYs documentation is converted 
to RST (Documentation/driver-api/phy/phy.rst), so it could simply 
include those comments from .c file. This can be done in separate patch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
