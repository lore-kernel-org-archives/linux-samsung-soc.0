From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
 exynos5250
Date: Thu, 1 Aug 2019 11:35:24 +0200
Message-ID: <79a50bdd-17ba-4e2f-5389-4b39ed440685@samsung.com>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com>
 <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
 <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
 <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
 <DBBPR08MB46788EBBB3BF3BB8C54FAD1283C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
 <CAJKOXPevC8GN=te7ub5Voq=dfn2HgJBbb=niVdD-gtWDUsq3Ow@mail.gmail.com>
 <CGME20190731143753epcas2p1345484f3308512832701ef0ba495810e@epcas2p1.samsung.com>
 <DBBPR08MB4678D2A9A042269A8934E84183DF0@DBBPR08MB4678.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DBBPR08MB4678D2A9A042269A8934E84183DF0@DBBPR08MB4678.eurprd08.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guillaume Gardet <Guillaume.Gardet@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Guillaume,

On 2019-07-31 16:37, Guillaume Gardet wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 26 July 2019 12:40
>> To: Guillaume Gardet <Guillaume.Gardet@arm.com>
>> Cc: linux-samsung-soc@vger.kernel.org; Kukjin Kim <kgene@kernel.org>;
>> linux-arm-kernel@lists.infradead.org
>> Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
>> exynos5250
>>
>> On Thu, 25 Jul 2019 at 14:37, Guillaume Gardet <Guillaume.Gardet@arm.com>
>> wrote:
>>>> No, regulator is not provided. On all Exynos boards Mali uses its
>>>> own dedicated regulator (and sometimes additional one). It worked in
>>>> your case because the regulator was set as always-on but this is a
>> workaround for lack of consumers.
>>>> Once there is a consumer, the regulator should not be always-on to
>>>> save the energy when not used.
>>> I do not have the required info here. Do you have it, or could I skip the
>> mali-supply for now?
>>
>> You can guess from regulator name :)
>> For the Arndale, the schematics are saying it is buck4.
> Thanks. This is buck4 as well for snow.
>
> On Arndale board, buck4 has a fixed voltage of 1V contrary to snow, which leads to the following error:
> [   21.131930] panfrost 11800000.gpu: Cannot set voltage 925000 uV
>
> The following change fixes the previous error:
> -                               regulator-min-microvolt = <1000000>;
> -                               regulator-max-microvolt = <1000000>;
> +                               regulator-min-microvolt = <850000>;
> +                               regulator-max-microvolt = <1300000>;
>
> Should I remove arndale enablement for now until this is fixed separately, or could I add this fixup in this patch serie, as it is related?

It is okay to add this fixup to the patch, which sets mali regulator on 
arndale board.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
