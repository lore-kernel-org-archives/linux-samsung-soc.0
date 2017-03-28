From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 0/6] Pad retentions support for Exynos5433
Date: Tue, 28 Mar 2017 13:14:27 +0300
Message-ID: <CAJKOXPc7bmAFjqS59Tqm=-vqMpC8-w0KsmabZDZZLN13h593CQ@mail.gmail.com>
References: <CGME20170323080346eucas1p216eec41325d220774ecec05b397e83a6@eucas1p2.samsung.com>
 <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
 <CACRpkdY1snu8tNaUW4hR7zvMSMv10wUoeAnv28Ag=NJuHAS-Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdY1snu8tNaUW4hR7zvMSMv10wUoeAnv28Ag=NJuHAS-Pw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 28, 2017 at 12:22 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Thu, Mar 23, 2017 at 9:03 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>
>> This patchset is a next step to add support for all power domains on
>> Exynos5433 SoCs. This patchset contains patches for Exynos pin control
>> driver and Exynos LPASS MFD driver, which are needed to make the
>> platform ready for adding power domains support.
>>
>> Patches in this patchset have runtime dependency. They are order in such
>> a way to make the changes bisectable (mfd lpass changes should be applied
>> after pinctrl patches). Other dependencies mentioned previously in v3 of
>> this patchset has been finally merged to v4.11-rc1.
>>
>> Patches have been rebased on top of linux v4.11-rc3.
>
> Pinctrl development is based on -rc1.
>
> I expect Krzysztof to figure out and apply the patches to his Samsung pinctrl
> branch and forward to me, all looks OK to me.

Yes, I already have them:
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/log/?h=pinctrl-next

However this reminds me to prepare a pull request for mfd tree because
they base on top of it.

Best regards,
Krzysztof
