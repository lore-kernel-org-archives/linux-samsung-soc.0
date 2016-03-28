From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 3/8] clk: samsung: exynos3250: Add MMC2 clock
Date: Mon, 28 Mar 2016 09:44:51 +0900
Message-ID: <56F87E83.7060100@samsung.com>
References: <1458027490-13787-1-git-send-email-cw00.choi@samsung.com>
 <1458027490-13787-4-git-send-email-cw00.choi@samsung.com>
 <56F47ABC.7060006@samsung.com> <56F509E6.7080807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <56F509E6.7080807@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: k.kozlowski@samsung.com, kgene@kernel.org, tomasz.figa@gmail.com, jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On 2016=EB=85=84 03=EC=9B=94 25=EC=9D=BC 18:50, Sylwester Nawrocki wrot=
e:
> Hi Chanwoo,
>=20
> On 03/25/2016 12:39 AM, Chanwoo Choi wrote:
>> diff --git a/include/dt-bindings/clock/exynos3250.h=20
>> b/include/dt-bindings/clock/exynos3250.h
>>> index ddb874130d86..c796ff02ceeb 100644
>>> --- a/include/dt-bindings/clock/exynos3250.h
>>> +++ b/include/dt-bindings/clock/exynos3250.h
> ...
>>> -#define CLK_NR_CLKS			249
>>> +#define CLK_NR_CLKS			250
>=20
> What do you think about putting all the changes to include/dt-binding=
s/
> clock/exynos3250.h into a separate patch? Now in patch 3/8 there
> is being changed again what was added in patch 2/8. However, my main
> point is to have a minimum required in a common topic branch for the =
clk
> and the arm-soc trees, so there is no need for arm-soc to pull all
> the drives/clk changes.
> It might not be that sensible in case of just those 2 patches in your
> series, nevertheless it would be good to keep that in mind for future
> submissions.

You mean that separate patch1 include only the new clock id about both =
UART2 and MMC2
and the patch2/patch3 just use the new clock id as following:

patch1 dt-bindings: Add the clock id of UART2 and MMC2 for Exynos3250
patch2 clk: samsung: exynos3250: Add UART2 clock
patch3 clk: samsung: exynos3250: Add MMC2 clock

As far as I understand it is that right?
If it is ok, I'll modify it on v4 patchset as you comment.

Best Regards,
Chanwoo Choi
