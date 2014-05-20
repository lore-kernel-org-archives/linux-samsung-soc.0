From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: enable display for peach-pit and snow
 boards
Date: Tue, 20 May 2014 12:35:40 +0530
Message-ID: <CAPdUM4NBCC+R+WkREhLhh0sDTg35bKyb6FZhgYJiUDVtEtXjdw@mail.gmail.com>
References: <1399630186-22610-1-git-send-email-rahul.sharma@samsung.com>
 <537A25F8.4040604@samsung.com>
 <CAPdUM4OcHOiSAbNt_6yEo_YY3FqGxef=p33opW21nEt7P+m6Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPdUM4OcHOiSAbNt_6yEo_YY3FqGxef=p33opW21nEt7P+m6Xw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 20 May 2014 10:41, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Thanks Kukjin,
>
> I have changed it in my environment now.
>

Kukjin,

dp_hpd_gpio got accidentally merged to pinctrl_3 in your "for-next"
branch. It should
be in pinctrl_0.

/*****************/
        };

        dp_hpd_gpio: dp_hpd_gpio {
               samsung,pins = "gpx2-6";
               samsung,pin-function = <0>;
               samsung,pin-pud = <3>;
                samsung,pin-drv = <0>;
        };
};

&pinctrl_3 {
usb300_vbus_en: usb300-vbus-en {
/*****************/

Regards,
Rahul Sharma.

> Regards,
> Rahul Sharma.
>
> On 19 May 2014 21:10, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> On 05/09/14 19:09, Rahul Sharma wrote:
>>>
>>> From: Rahul Sharma<Rahul.Sharma@samsung.com>
>>
>>
>> Probably, should be "Rahul Sharma <rahul.sharma@...>"
>>
>> Please make sure your gitconfig has no problem.
>>
>> Just note, I found same thing and fixed your email address in my tree...
>>
>>
>>>
>>> Add nodes for fimd and dp controller for exynos5250 based snow
>>> and exynos5420 based peach-pit board.
>>>
>>> This series is based on Kukjin Kims, for-next branch.
>>>
>>> V3:
>>> 1) Dropped 1 patch "ARM: dts: move dp hpd line to the board file for
>>>   exynos5420".
>>> 2) Extra blank lines for readability.
>>> 3) dp hpd gpio name change (dp_hpd ->  dp_hpd_gpio)
>>>
>>> V2:
>>> 1) Rebase on Peach-pit dependent patches.
>>>
>>> It is dependent on
>>> 1) Andrew Bresticker's patch for hpd gpio addition, avilable at
>>> http://www.spinics.net/lists/linux-samsung-soc/msg28827.html [Patch is
>>> 'ACK'ed.]
>>> 2) Arun's patch for adding peach-pit board dts file at
>>> http://www.spinics.net/lists/linux-samsung-soc/msg30103.html. [Patch is
>>> 'ACK'ed.]
>>>
>>> Rahul Sharma (4):
>>>    ARM: dts: enable fimd for exynos5250 based snow board
>>>    ARM: dts: enable dp-controller for exynos5250 based snow board
>>>    ARM: dts: enable fimd for exynos5420 based peach-pit board
>>>    ARM: dts: enable dp-controller for exynos5420 based peach-pit board
>>>
>>>   arch/arm/boot/dts/exynos5250-snow.dts      |   35
>>> ++++++++++++++++++++++++
>>>   arch/arm/boot/dts/exynos5420-peach-pit.dts |   41
>>> ++++++++++++++++++++++++++++
>>>   2 files changed, 76 insertions(+)
>>>
>> OK, applied whole series with Jingoo's 'reviewed-by'.
>>
>> Thanks,
>> Kukjin
