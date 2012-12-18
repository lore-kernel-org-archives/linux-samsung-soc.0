From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: add pinctrl nodes for Exynos5250 SoC
Date: Tue, 18 Dec 2012 09:08:59 -0800
Message-ID: <50D0A32B.9050400@samsung.com>
References: <1355403978-388-1-git-send-email-thomas.abraham@linaro.org>
 <CACRpkdZgSpkHW3mW_2ZhvUWVTX7Qppb5G8d+MdD3zUDOYCY-pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZgSpkHW3mW_2ZhvUWVTX7Qppb5G8d+MdD3zUDOYCY-pw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kgene.kim@samsung.com, patches@linaro.org, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 12/14/12 12:34, Linus Walleij wrote:
> On Thu, Dec 13, 2012 at 2:06 PM, Thomas Abraham
> <thomas.abraham@linaro.org>  wrote:
>
>> Add pinctrl device nodes for Exynos5250 SoC.
>>
>> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
>
> Acked-by: Linus Walleij<linus.walleij@linaro.org>
>
>> - The individual device nodes which are using the old style Samsung gpio
>>    bindings have not been converted over to pinctrl bindings yet. It might
>>    also be important to know if Linus's pinctrl grab in device core patch
>>    (http://comments.gmane.org/gmane.linux.kernel/1409263) gets accepted.
>
> Greg seems happy with it and the plan is to have it merged for kernel
> v3.9.
>
> I intend to push Greg for an ACK and queue it for linux-next right after the
> merge window.
>
Same here ;-)

>> - This patch should not be merged for now which otherwise would break existing
>>    platforms which are using the old samsung gpio driver bindings. This patch
>>    is intended to get started with the migration to pinctrl framework.
>>    It is probably better to first prepare all the migration patches and
>>    merge them as a bunch.
>
> Sure. I guess it'll be taken through the Samsung tree anyway, right?
>
I'm OK on this, if Greg is OK, then let me pick this up in Samsung tree.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
