From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/8] ARM: dts: s3c64xx: Enable watchdog on all S3C64xx
 boards
Date: Tue, 14 Mar 2017 15:34:24 +0200
Message-ID: <CAJKOXPemHJ1ww3LkHwP+MKF4Wpp-C2b_Ww4GLkGnjbc9M-wpaQ@mail.gmail.com>
References: <20170311172527.16368-1-krzk@kernel.org>
 <4386279.iJpUOasmTG@amdc3058>
 <CGME20170314133035epcas1p47a04430402688bbb6baebad69b8e5b24@epcas1p4.samsung.com>
 <CAJKOXPeCK1cjY78+PfcTprTnyXJ1k9zcUj8nW7onG8y0TWGzzQ@mail.gmail.com>
 <1633762.1QWnRjdako@amdc3058>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1633762.1QWnRjdako@amdc3058>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Wim Van Sebroeck <wim@iguana.be>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 14, 2017 at 3:30 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On Tuesday, March 14, 2017 03:04:28 PM Krzysztof Kozlowski wrote:
>> On Tue, Mar 14, 2017 at 2:58 PM, Bartlomiej Zolnierkiewicz
>> <b.zolnierkie@samsung.com> wrote:
>> >
>> > Hi,
>> >
>> > On Saturday, March 11, 2017 07:25:23 PM Krzysztof Kozlowski wrote:
>> >> Watchdog module does not have external dependencies so it can be safely
>> >> enabled in s3c64xx.dtsi thus making it available for all S3C64xx-based
>> >> boards.
>> >>
>> >> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> >
>> > Please first fix the driver w.r.t. infinite interrupt in soft mode
>> > issue and only then enable it on more hardware.  IOW this patch
>> > should be placed after patch #7 in the series.
>>
>> The soft-interrupt mode is not the default one so this should not
>> cause any issues by default but I got your point. Makes sense. The
>> pity is the timing. There wasn't much interest in the patchset (no
>> comments since 24 of Feb) so I merged it yesterday evening. Does it
>> brake any platform/board?
>
> OK, let it be as it as it doesn't break the default setup.
>
> However please consider the fact that posting revised patches
> (v2 was posted *yesterday*) for a review and then merging them
> the same day is not a good practice..

v2 was posted on March 11, not yesterday but I got the point that the
rest of world is working from Monday not Sunday. :) And v1 was on 24
of Feb. Usually I try to give them more time but recently there is so
less interest in this that I gave up waiting. I will give them more
time in the future.

Thanks for review!

Krzysztof
