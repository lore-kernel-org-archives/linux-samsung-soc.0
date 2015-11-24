From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] thermal: exynos: use of_property_read_u8()
Date: Tue, 24 Nov 2015 10:28:25 +0900
Message-ID: <5653BD39.6060406@samsung.com>
References: <1448287841-4816-1-git-send-email-saurabh.truth@gmail.com>
 <20151123232933.GB6815@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20151123232933.GB6815@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>, Saurabh Sengar <saurabh.truth@gmail.com>
Cc: l.majewski@samsung.com, rui.zhang@intel.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 24.11.2015 08:29, Eduardo Valentin wrote:
> On Mon, Nov 23, 2015 at 07:40:41PM +0530, Saurabh Sengar wrote:
>> use of_property_read_u8() for u8 variables,
>> also changed the return type to void as this function return type
>> is nowhere used.
>>
> 
> I would be good if you could split both changes into two patches.
> 
> Also, I still do not understand properly the proposal to use u8.
> 
> Why are they u8?
> 
> If they are so, please document them in their DT bindings. Today, the
> bindings tell us they are s32 (as there is nothing really specifying the
> type).

It looks like u8 came from platform data from old times when the driver
did not support DT. All of our Exynos mainline boards are converted to
DT, so I think legacy platform data can be also changed to match DT.
Which means changing from u8 to u32.

Best regards,
Krzysztof
