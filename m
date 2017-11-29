From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: Switch to dedicated Odroid-XU3
 sound card binding
Date: Wed, 29 Nov 2017 18:55:48 +0100
Message-ID: <CAJKOXPegJsQPrbDH8mXBhypOBnT9+Nn1T6NF=Cav=PV+9b-2MA@mail.gmail.com>
References: <20171103165446.15438-1-s.nawrocki@samsung.com>
 <CGME20171103165539epcas1p48cc87811574dace9dfe91d8e9ec6f7ca@epcas1p4.samsung.com>
 <20171103165446.15438-2-s.nawrocki@samsung.com>
 <20171127181213.lxtbbiw75wbz2dbz@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171127181213.lxtbbiw75wbz2dbz@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, kgene@kernel.org, mihailescu2m@gmail.com, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 27, 2017 at 7:12 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Nov 03, 2017 at 05:54:45PM +0100, Sylwester Nawrocki wrote:
>> The new sound card DT binding is used for Odroid XU3 in order
>> to properly support the HDMI audio path.
>> Clocks configuration is changed so the I2S controller is now the bit
>> and the frame clock master with EPLL as the root clock source.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi                    |  1 +
>>  arch/arm/boot/dts/exynos5420.dtsi                 |  1 +
>>  arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 60 ++++++++++++++---------
>>  3 files changed, 40 insertions(+), 22 deletions(-)
>>


Unfortunately this patch causes the audio card to disappear on Odroid
XU3. "aplay -L" shows nothing and obviously speaker-test fails.

Applied on v4.15-rc1... any dependencies are missing?

Full boot-logs are here:
http://www.krzk.eu/#/builders/1/builds/976
(test exits on aplay -L).

Should this be dropped?

Best regards,
Krzysztof
