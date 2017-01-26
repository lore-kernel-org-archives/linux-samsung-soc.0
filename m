From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/8] Pad retentions support for Exynos5433
Date: Thu, 26 Jan 2017 16:47:03 +0100
Message-ID: <CACRpkdaDynGgTZeXxwxDPpVvL3or54zFjRwjx+yG_F7vee6-sQ@mail.gmail.com>
References: <CGME20170126083401eucas1p20b4794fe46ccf2189bf734f0d8e3c536@eucas1p2.samsung.com>
 <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CACRpkdawiAp3xqVd7J5ZAd2dQ=X09DGybyw0EVp=07w8-ccKfA@mail.gmail.com>
 <CAJKOXPd+WYyB4KbX2XN_Y615KR8AMZW8A+uV+6vU_AN3u+QCaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPd+WYyB4KbX2XN_Y615KR8AMZW8A+uV+6vU_AN3u+QCaA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 26, 2017 at 3:32 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Jan 26, 2017 at 11:50 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> On Thu, Jan 26, 2017 at 9:33 AM, Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>
>>> Patches in this patchset depends on each other. They are order in such a
>>> way to make the changes bisectable.
>>>
>>> Patch #3 has runtime dependency on #1.
>>> Patch #5 has runtime dependency on #3.
>>> Patch #6 has runtime dependency on #4.
>>>
>>> This patchset also directly depends on the "Move pad retention control to
>>> Exynos pin controller driver" patchset:
>>> https://www.spinics.net/lists/arm-kernel/msg556074.html
>>
>> Do we *have* to merge it runtime-bisectably?
>>
>> I'm asking because we need a huge immutable branch
>> (I guess in the MFD subsystem) to deal with that.
>
> It helps a lot with finding introduced issues, so I think yes - we
> want it runtime-bisectable. The board has already support in mainline
> so it is not theoretical runtime...

OK I just wait for an immutable branch to pull for this to work
out then.

Yours,
Linus Walleij
