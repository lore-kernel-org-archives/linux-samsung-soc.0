Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BD01D173A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2024 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729519952; cv=none; b=R8qiDHIgqNiS125OFcrMmuMlvW/DPphJ5yyzsrd3IBJpLQlwkyd84mgjXR08GGbhMEiUytnjsI26RMPDLZwh6yI754U9s7Wqa2+SsvwOkooIzn5M+ZsYOkcODntsRKCIK9NEA4S4g0JwU3f4ncSy5aL0eHnNc2jkEy7OyZU/Bbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729519952; c=relaxed/simple;
	bh=AjRBeWb78ciyAh/UJgkExb5iegYw7iPJuNoHvXMqzPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r40TtSUT+zHZZwEBgxwLsD7+O4D8JFO3xz/FBO3zzFoQc4jRIbMD74j/bUKN0uNHbo+9AhbSwjY01/ZVZdfdIYl/B8nOHleNjIU1Uq+naenBOQU2jWL1j115c9XJdILxzfGSow/5uJ1p5hr6CaPfcvPw/uDzA6fZAPQbzqV5+hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckxi9FKy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckxi9FKy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so31982535e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2024 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729519947; x=1730124747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ka3hxjKCObqVUOT391ctRJJwZEb+Srznv1xzHAnMKN0=;
        b=ckxi9FKy96iEikdmKdIbuAR3uS6ggeUuTxA87aEwkHAkfNxdzaREs/IpAFy1XQq99y
         KycD6AuXT+5A/DLRC7OojeOVlo0qUOPmASWKdoAmvmZAJJ0Nh9htwPUv2xmiPIsD1CfA
         1jrqJMny/JgC4JBuBMm8/jvEoZSW5xVGMzvuJaDfX4TMSxiQbdyLAbcTubEsfjwaUgur
         16CuZH9HsSg3OppR0+7K2NDSQhaTPXhbuR00HcIP1m9uX/2Ph4k6HhSCK1vE86lv1L32
         aXVIxm41hiAWPA16nl6Mop28jA+8y7vrhUvNUI8fHamwgntJVGNNBGM0EVnSzaaoWA2o
         xuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729519947; x=1730124747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ka3hxjKCObqVUOT391ctRJJwZEb+Srznv1xzHAnMKN0=;
        b=xFtbRFW0AX+Xq4X/CqffxkgEarZarNAT/goTkt7WEb0KF/ngfX0dTzoE+sRlK2jdUY
         OJCl6ekMpwefqc9gfln2ZYrtThJL4qU0RY85uI9hsSJQrqhsetQpeASFrNHbizzzJ+Dv
         Trr8ArmKrleJFr6ghhEd+CQcSWwOTBbSJK5B+HI8HAHF4Yx6UebqSIJPELYu0tJ6oM79
         ga+U2+mrzxkpoFYZfqBu392zTr+1TlXXRPlyMIyYX4nsKpgxg2XMueH6+KKgnFSdhSnO
         o+/Z7nbD1Xahe7YfGnNwVUhAI1fZKP85tA+w9KZv5G85Z0uJq2zGjgrzwogKQgDgRbhH
         9Yag==
X-Forwarded-Encrypted: i=1; AJvYcCWrhjLBjc5FQjfpCuW6sggQoOyZIoubYlLxoJ9ZTbTMi53JhiKFDff1R+nTPG4EnVUr4uhC7QVh0E2KwQiTaQnvMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXSJ+PCme6yi/vD+ACNbpaSPsM/Qj+KcRErZzbTurYRa/yURJK
	cvh+YtxBFxyZCMCC7yp+NBn/gg4kF+FD69VwihVEqKaL/W9Gwe6k83ge+2Xw7HA=
X-Google-Smtp-Source: AGHT+IFcvfX6oTke7Befxo55YoeCvk1P+g46qIpdYMHQ60AIWXOL2m9OTz9hasK+rZXnuFhMfl7DfQ==
X-Received: by 2002:a05:600c:4f47:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-4317b8d662amr1183245e9.7.1729519945586;
        Mon, 21 Oct 2024 07:12:25 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bd6esm4428320f8f.104.2024.10.21.07.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 07:12:24 -0700 (PDT)
Message-ID: <d41ee8f6-9a2c-4e33-844a-e71224692133@linaro.org>
Date: Mon, 21 Oct 2024 15:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: Krzysztof Kozlowski <krzk@kernel.org>, jassisinghbrar@gmail.com
Cc: alim.akhtar@samsung.com, mst@redhat.com, javierm@redhat.com,
 tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

On 10/21/24 12:52 PM, Krzysztof Kozlowski wrote:
> On 17/10/2024 18:36, Tudor Ambarus wrote:
>> ACPM (Alive Clock and Power Manager) is a firmware that operates on the
>> APM (Active Power Management) module that handles overall power management
>> activities. ACPM and masters regard each other as independent
>> hardware component and communicate with each other using mailbox messages
>> and shared memory.
>>
>> The mailbox channels are initialized based on the configuration data
>> found at a specific offset into the shared memory (mmio-sram). The
>> configuration data consists of channel id, message and queue lengths,
>> pointers to the RX and TX queues which are also part of the SRAM, and
>> whether RX works by polling or interrupts. All known clients of this
>> driver are using polling channels, thus the driver implements for now
>> just polling mode.
>>
>> Add support for the exynos acpm core driver. Helper drivers will follow.
>> These will construct the mailbox messages in the format expected by the
>> firmware.
> 
> I skimmed through the driver and I do not understand why this is
> firmware. You are implementing a mailbox provider/controller.

In my case the mailbox hardware is used just to raise the interrupt to
the other side. Then there's the SRAM which contains the channels
configuration data and the TX/RX queues. The enqueue/deque is done
in/from SRAM. This resembles a lot with drivers/firmware/arm_scmi/, see:

drivers/firmware/arm_scmi/shmem.c
drivers/firmware/arm_scmi/transports/mailbox.c

After the SRAM and mailbox/transport code I'll come up with two helper
drivers that construct the mailbox messages in the format expected by
the firmware. There are 2 types of messages recognized by the ACPM
firmware: PMIC and DVFS. The client drivers will use these helper
drivers to prepare a specific message. Then they will use the mailbox
core to send the message and they'll wait for the answer.

This layered structure and the use of SRAM resembles with arm_scmi and
made me think that the ACPM driver it's better suited for
drivers/firmware. I'm opened for suggestions though.

> 
> I did not perform full review yet, just skimmed over the code. I will
> take a look a bit later.
> 

No worries, thanks for doing it. I agree with all the suggestions from
below and I'll address them after we get an agreement with Jassi on how
to extend the mailbox core.

More answers below.

>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/firmware/Kconfig                    |   1 +
>>  drivers/firmware/Makefile                   |   1 +
>>  drivers/firmware/samsung/Kconfig            |  11 +
>>  drivers/firmware/samsung/Makefile           |   3 +
>>  drivers/firmware/samsung/exynos-acpm.c      | 703 ++++++++++++++++++++
> 
> Please add directory to the Samsung Exynos SoC maintainer entry. I also
> encourage adding separate entry for the driver where you would be listed
> as maintainer.

ok

> 
> There is no firmware tree, so this will be going via Samsung SoC.

I noticed afterwards, thanks.

> 
>>  include/linux/mailbox/exynos-acpm-message.h |  21 +
>>  6 files changed, 740 insertions(+)
>>  create mode 100644 drivers/firmware/samsung/Kconfig
>>  create mode 100644 drivers/firmware/samsung/Makefile
>>  create mode 100644 drivers/firmware/samsung/exynos-acpm.c
>>  create mode 100644 include/linux/mailbox/exynos-acpm-message.h
>>
>> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>> index 71d8b26c4103..24edb956831b 100644
>> --- a/drivers/firmware/Kconfig
>> +++ b/drivers/firmware/Kconfig
>> @@ -267,6 +267,7 @@ source "drivers/firmware/meson/Kconfig"
>>  source "drivers/firmware/microchip/Kconfig"
>>  source "drivers/firmware/psci/Kconfig"
>>  source "drivers/firmware/qcom/Kconfig"
>> +source "drivers/firmware/samsung/Kconfig"
>>  source "drivers/firmware/smccc/Kconfig"
>>  source "drivers/firmware/tegra/Kconfig"
>>  source "drivers/firmware/xilinx/Kconfig"
>> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>> index 7a8d486e718f..91efcc868a05 100644
>> --- a/drivers/firmware/Makefile
>> +++ b/drivers/firmware/Makefile
>> @@ -33,6 +33,7 @@ obj-y				+= efi/
>>  obj-y				+= imx/
>>  obj-y				+= psci/
>>  obj-y				+= qcom/
>> +obj-y				+= samsung/
>>  obj-y				+= smccc/
>>  obj-y				+= tegra/
>>  obj-y				+= xilinx/
>> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
>> new file mode 100644
>> index 000000000000..f908773c1441
>> --- /dev/null
>> +++ b/drivers/firmware/samsung/Kconfig
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config EXYNOS_ACPM
>> +	tristate "Exynos ACPM (Alive Clock and Power Manager) driver support"
> 
> depends ARCH_EXYNOS || COMPILE_TEST

oh yes.
> 
> Please also send a arm64 defconfig change making it a module.

will do

cut

>> +
>> +/**
>> + * struct exynos_acpm_shmem_chan - descriptor of a shared memory channel.
>> + *
>> + * @id:			channel ID.
>> + * @reserved:		reserved for future use.
>> + * @rx_rear:		rear pointer of RX queue.
>> + * @rx_front:		front pointer of RX queue.
>> + * @rx_base:		base address of RX queue.
>> + * @reserved1:		reserved for future use.
>> + * @tx_rear:		rear pointer of TX queue.
>> + * @tx_front:		front pointer of TX queue.
>> + * @tx_base:		base address of TX queue.
>> + * @qlen:		queue length. Applies to both TX/RX queues.
>> + * @mlen:		message length. Applies to both TX/RX queues.
>> + * @reserved2:		reserved for future use.
>> + * @polling:		true when the channel works on polling.
>> + */
>> +struct exynos_acpm_shmem_chan {
>> +	u32 id;
>> +	u32 reserved[3];
>> +	u32 rx_rear;
>> +	u32 rx_front;
>> +	u32 rx_base;
>> +	u32 reserved1[3];
>> +	u32 tx_rear;
>> +	u32 tx_front;
>> +	u32 tx_base;
>> +	u32 qlen;
>> +	u32 mlen;
>> +	u32 reserved2[2];
>> +	u32 polling;
> 
> Why are you storing addresses as u32? Shouldn't these be __iomem*?

This structure defines the offsets in SRAM that describe the channel
parameters. Instances of this struct shall be declared indeed as:
	struct exynos_acpm_shmem_chan __iomem *shmem_chan;
I missed that in v2, but will update in v2.

> 
> I also cannot find any piece of code setting several of above, e.g. tx_base

I'm not writing any SRAM configuration fields, these fields are used to
read/retrive the channel parameters from SRAM.

cut

>> +
>> +	spin_lock_irqsave(&chan->tx_lock, flags);
>> +
>> +	tx_front = readl_relaxed(chan->tx.front);
>> +	idx = (tx_front + 1) % chan->qlen;
>> +
>> +	ret = exynos_acpm_wait_for_queue_slots(mbox_chan, idx);
>> +	if (ret)
>> +		goto exit;
>> +
>> +	exynos_acpm_prepare_request(mbox_chan, req);
>> +
>> +	/* Write TX command. */
>> +	__iowrite32_copy(chan->tx.base + chan->mlen * tx_front, tx->cmd,
>> +			 req->txlen / 4);
>> +
>> +	/* Advance TX front. */
>> +	writel_relaxed(idx, chan->tx.front);
>> +
>> +	/* Flush SRAM posted writes. */
>> +	readl_relaxed(chan->tx.front);
>> +
> 
> How does this flush work? Maybe you just miss here barries (s/relaxed//)?

I think _relaxed() accessors should be fine in this driver as there are
no DMA accesses involved. _relaxed() accessors are fully ordered for
accesses to the same device/endpoint.

I'm worried however about the posted writes, the buses the devices sit
on may themselves have asynchronicity. So I issue a read from the same
device to ensure that the write has occured.

There is something that I haven't dimistified though. You'll notice that
the writes from above are on SRAM. I enqueue on the TX queue then
advance the head/front of the queue and then I read back to make sure
that the writes occured. Below I write to the controller's interrupt
register (different device/endpoint) to raise the interrupt for the
counterpart and inform that TX queue advanced. I'm not sure whether I
need a barrier here to make sure that the CPU does not reorder the
accesses and raise the interrupt before advancing the TX queue. If
someone already knows the answer, please say, I'll do some more reading
in the meantime.

> 
>> +	/* Generate ACPM interrupt. */
>> +	writel_relaxed(BIT(chan->id), exynos_acpm->regs + EXYNOS_ACPM_INTGR1);
>> +
>> +	/* Flush mailbox controller posted writes. */
>> +	readl_relaxed(exynos_acpm->regs + EXYNOS_ACPM_MCUCTRL);
>> +
>> +	spin_unlock_irqrestore(&chan->tx_lock, flags);
>> +
>> +	queue_work(exynos_acpm->wq, &work_data->work);
>> +
>> +	return -EINPROGRESS;
>> +exit:
>> +	spin_unlock_irqrestore(&chan->tx_lock, flags);
>> +	kfree(work_data);
>> +	return ret;
>> +}

cut

>> +static const struct of_device_id exynos_acpm_match[] = {
>> +	{ .compatible = "google,gs101-acpm" },
> 
> Where are the bindings?

will follow soon.

cut

>> +static int exynos_acpm_probe(struct platform_device *pdev)
>> +{

cut

>> +	exynos_acpm->pclk = devm_clk_get(dev, "pclk");
> 
> devm_clk_get_enabled

ok

> 
>> +	if (IS_ERR(exynos_acpm->pclk)) {
>> +		dev_err(dev, "Missing peripheral clock.\n");
> 
> return dev_err_probe()

ok

cut
>> +		.owner	= THIS_MODULE,
> 
> Drop

oh yes, thanks!

ta
