From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH v6 05/14] drm/exynos: dsi: add TE interrupt handler to
 support LCD I80 interface
Date: Tue, 22 Jul 2014 20:10:18 +0900
Message-ID: <53CE469A.3090701@samsung.com>
References: <53CE3C45.9010509@samsung.com>
 <1406026184-29185-1-git-send-email-yj44.cho@samsung.com>
 <53CE43B3.2080203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53CE43B3.2080203@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Varka Bhadram <varkabhadram@gmail.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Varka,

This irq handler should be registered in attach() and unregistered in 
detach().

The devm_* APIs are released(freed) in remove(), right?

Logically the panel could be attached and detached several times after 
dsi is probed and not removed.
So I don't use devm_* APIs.

Thank you.
Best regards YJ

On 07/22/2014 07:57 PM, Varka Bhadram wrote:
> On 07/22/2014 04:19 PM, YoungJun Cho wrote:
>
> (...)
>
>> +    ret = gpio_request_one(dsi->te_gpio, GPIOF_IN, "te_gpio");
>
> devm_* APIs..?
>
>> +    if (ret) {
>> +        dev_err(dsi->dev, "gpio request failed with %d\n", ret);
>> +        goto out;
>> +    }
>> +
>> +    /*
>> +     * This TE GPIO IRQ should not be set to IRQ_NOAUTOEN, because panel
>> +     * calls drm_panel_init() first then calls mipi_dsi_attach() in
>> probe().
>> +     * It means that te_gpio is invalid when exynos_dsi_enable_irq() is
>> +     * called by drm_panel_init() before panel is attached.
>> +     */
>> +    ret = request_threaded_irq(gpio_to_irq(dsi->te_gpio),
>> +                    exynos_dsi_te_irq_handler, NULL,
>> +                    IRQF_TRIGGER_RISING, "TE", dsi);
>
> why don't we use devm_request_threaded_irq()..?
>
>
