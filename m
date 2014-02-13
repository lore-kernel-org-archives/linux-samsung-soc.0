From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Thu, 13 Feb 2014 12:19:50 -0800
Message-ID: <CAOesGMgKTctn4aHpvsqzWpgocgmD0vQb9e508sm48jt9PtH6RA@mail.gmail.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
 <1392100183-30930-3-git-send-email-kgene.kim@samsung.com>
 <CAOesGMiWsWXkQkb-_VZGco0gKNZPsHf3ubR88y4Pt4-umk5_Ww@mail.gmail.com>
 <CAL_JsqJ5FHt4HoV2NtU1ddFpcdxi=Jji0-mPSXL872P8fXrCuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJ5FHt4HoV2NtU1ddFpcdxi=Jji0-mPSXL872P8fXrCuQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Ilho Lee <ilho215.lee@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Feb 13, 2014 at 12:08 PM, Rob Herring <robherring2@gmail.com> wrote:
> On Tue, Feb 11, 2014 at 5:39 PM, Olof Johansson <olof@lixom.net> wrote:
>> On Mon, Feb 10, 2014 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>>> This patch adds support for Samsung GH7 SoC in arm64/Kconfig.
>>>
>>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>
>> The overhead of building one more device tree isn't very large, and I
>> don't see any other need to have a Kconfig entry per SoC at this time.
>> It's of course up to Catalin, but you might just want to always
>> compile all dts files instead.
>
> I think having "make dtbs" build all regardless of the config would be
> better.

We can do that too, but that doesn't mean it's useful to have this
kconfig entry.

> Perhaps a "all_dtbs" target could be added and everyone can
> get what they want. If/when we add checking into dtc, this we
> certainly become more desirable.


-Olof
