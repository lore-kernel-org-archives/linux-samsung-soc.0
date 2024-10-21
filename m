Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95D1E1A3B;
	Mon, 21 Oct 2024 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729511569; cv=none; b=LiZ7bQp0H2QusSJJ72cu74TDj/UqSOvz4CBiAik23sf6GU/J8UKACKLdswkz3LETo2ZyKdAyUKiMcdZJOQLKtUt2BiCX4Q6gYGVk4zmIWt91WwoNbz8Eg8iWkYs7hIizxpIH28hkjlyPcCsL9TEwnn00utCzzjyJp9N8zApWcAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729511569; c=relaxed/simple;
	bh=f1Tcjr0unYKUdwCuI+4x3CLqeJDDeH1NxFPkm27MdQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+jFc1PI3F19q2LI5KcNbmjDpQTy+Xg3TDsseW3E6U36o/mWEp6Jk5x+cZEOUnOZwz8exAVvkyb+upWd7NEwDehLF7ZZPqIOoqytZnTyqGHmxFbUULN9h15ph/46IdXEGLhJXYaJo/+u4rjnpNzaF+BliYxynnOGgbkdWLGVdE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GF5OFnWf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GF5OFnWf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDACC4CEC3;
	Mon, 21 Oct 2024 11:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729511569;
	bh=f1Tcjr0unYKUdwCuI+4x3CLqeJDDeH1NxFPkm27MdQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GF5OFnWfrVOtctG2yJ9iFPPMngU4mcUTaGnr2VaSA8mILMjfJiv9KadlhzXTK4d0p
	 HIlxx+eZTDvyF2kKNpudS96MuxxyyNB+xe/9PDKT+1p7/3IOs5jzoIe24aHfrU7diX
	 zFVFv1kefcXiBQt/JYwuGDJ+wvKVbtZrvpvjtjRT9ysSg/EjXSMbvyuLK4FYxOQ3Tx
	 WhNqLr6/twEeF0iaH0iIIxI4HnVweYHlcwxhlaiKbPQUla4Nnhsz3hCvUpotGnqpjC
	 I05bSOvCSkZwxSN3DuAoNnk9cIc7KX5/ZtUzMUuAu6cTVlZVc6mpstPIOpGGYLizE8
	 OCvzH6s/BvMjw==
Message-ID: <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
Date: Mon, 21 Oct 2024 13:52:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>, jassisinghbrar@gmail.com
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241017163649.3007062-3-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2024 18:36, Tudor Ambarus wrote:
> ACPM (Alive Clock and Power Manager) is a firmware that operates on the
> APM (Active Power Management) module that handles overall power management
> activities. ACPM and masters regard each other as independent
> hardware component and communicate with each other using mailbox messages
> and shared memory.
> 
> The mailbox channels are initialized based on the configuration data
> found at a specific offset into the shared memory (mmio-sram). The
> configuration data consists of channel id, message and queue lengths,
> pointers to the RX and TX queues which are also part of the SRAM, and
> whether RX works by polling or interrupts. All known clients of this
> driver are using polling channels, thus the driver implements for now
> just polling mode.
> 
> Add support for the exynos acpm core driver. Helper drivers will follow.
> These will construct the mailbox messages in the format expected by the
> firmware.

I skimmed through the driver and I do not understand why this is
firmware. You are implementing a mailbox provider/controller.

I did not perform full review yet, just skimmed over the code. I will
take a look a bit later.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/firmware/Kconfig                    |   1 +
>  drivers/firmware/Makefile                   |   1 +
>  drivers/firmware/samsung/Kconfig            |  11 +
>  drivers/firmware/samsung/Makefile           |   3 +
>  drivers/firmware/samsung/exynos-acpm.c      | 703 ++++++++++++++++++++

Please add directory to the Samsung Exynos SoC maintainer entry. I also
encourage adding separate entry for the driver where you would be listed
as maintainer.

There is no firmware tree, so this will be going via Samsung SoC.

>  include/linux/mailbox/exynos-acpm-message.h |  21 +
>  6 files changed, 740 insertions(+)
>  create mode 100644 drivers/firmware/samsung/Kconfig
>  create mode 100644 drivers/firmware/samsung/Makefile
>  create mode 100644 drivers/firmware/samsung/exynos-acpm.c
>  create mode 100644 include/linux/mailbox/exynos-acpm-message.h
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 71d8b26c4103..24edb956831b 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -267,6 +267,7 @@ source "drivers/firmware/meson/Kconfig"
>  source "drivers/firmware/microchip/Kconfig"
>  source "drivers/firmware/psci/Kconfig"
>  source "drivers/firmware/qcom/Kconfig"
> +source "drivers/firmware/samsung/Kconfig"
>  source "drivers/firmware/smccc/Kconfig"
>  source "drivers/firmware/tegra/Kconfig"
>  source "drivers/firmware/xilinx/Kconfig"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 7a8d486e718f..91efcc868a05 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -33,6 +33,7 @@ obj-y				+= efi/
>  obj-y				+= imx/
>  obj-y				+= psci/
>  obj-y				+= qcom/
> +obj-y				+= samsung/
>  obj-y				+= smccc/
>  obj-y				+= tegra/
>  obj-y				+= xilinx/
> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
> new file mode 100644
> index 000000000000..f908773c1441
> --- /dev/null
> +++ b/drivers/firmware/samsung/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config EXYNOS_ACPM
> +	tristate "Exynos ACPM (Alive Clock and Power Manager) driver support"

depends ARCH_EXYNOS || COMPILE_TEST

Please also send a arm64 defconfig change making it a module.

> +	select MAILBOX
> +	help
> +	  ACPM is a firmware that operates on the APM (Active Power Management)
> +	  module that handles overall power management activities. ACPM and
> +	  masters regard each other as independent hardware component and
> +	  communicate with each other using mailbox messages and shared memory.
> +	  This module provides the means to communicate with the ACPM firmware.
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
> new file mode 100644
> index 000000000000..35ff3076bbea
> --- /dev/null
> +++ b/drivers/firmware/samsung/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_EXYNOS_ACPM)	+= exynos-acpm.o
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> new file mode 100644
> index 000000000000..c3ad4dc7a9e0
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -0,0 +1,703 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2024 Linaro Ltd.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitmap.h>
> +#include <linux/bits.h>
> +#include <linux/container_of.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/exynos-acpm-message.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define EXYNOS_ACPM_MCUCTRL		0x0	/* Mailbox Control Register */
> +#define EXYNOS_ACPM_INTCR0		0x24	/* Interrupt Clear Register 0 */
> +#define EXYNOS_ACPM_INTMR0		0x28	/* Interrupt Mask Register 0 */
> +#define EXYNOS_ACPM_INTSR0		0x2c	/* Interrupt Status Register 0 */
> +#define EXYNOS_ACPM_INTMSR0		0x30	/* Interrupt Mask Status Register 0 */
> +#define EXYNOS_ACPM_INTGR1		0x40	/* Interrupt Generation Register 1 */
> +#define EXYNOS_ACPM_INTMR1		0x48	/* Interrupt Mask Register 1 */
> +#define EXYNOS_ACPM_INTSR1		0x4c	/* Interrupt Status Register 1 */
> +#define EXYNOS_ACPM_INTMSR1		0x50	/* Interrupt Mask Status Register 1 */
> +
> +#define EXYNOS_ACPM_INTMR0_MASK		GENMASK(15, 0)
> +#define EXYNOS_ACPM_PROTOCOL_SEQNUM	GENMASK(21, 16)
> +
> +/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
> +#define EXYNOS_ACPM_POLL_TIMEOUT	5000
> +#define EXYNOS_ACPM_TX_TIMEOUT_US	500000
> +
> +/**
> + * struct exynos_acpm_shmem - mailbox shared memory configuration information.
> + * @reserved:	reserved for future use.
> + * @chans:	offset to array of struct exynos_acpm_shmem_chan.
> + * @reserved1:	reserved for future use.
> + * @num_chans:	number of channels.
> + */
> +struct exynos_acpm_shmem {
> +	u32 reserved[2];
> +	u32 chans;
> +	u32 reserved1[3];
> +	u32 num_chans;
> +};
> +
> +/**
> + * struct exynos_acpm_shmem_chan - descriptor of a shared memory channel.
> + *
> + * @id:			channel ID.
> + * @reserved:		reserved for future use.
> + * @rx_rear:		rear pointer of RX queue.
> + * @rx_front:		front pointer of RX queue.
> + * @rx_base:		base address of RX queue.
> + * @reserved1:		reserved for future use.
> + * @tx_rear:		rear pointer of TX queue.
> + * @tx_front:		front pointer of TX queue.
> + * @tx_base:		base address of TX queue.
> + * @qlen:		queue length. Applies to both TX/RX queues.
> + * @mlen:		message length. Applies to both TX/RX queues.
> + * @reserved2:		reserved for future use.
> + * @polling:		true when the channel works on polling.
> + */
> +struct exynos_acpm_shmem_chan {
> +	u32 id;
> +	u32 reserved[3];
> +	u32 rx_rear;
> +	u32 rx_front;
> +	u32 rx_base;
> +	u32 reserved1[3];
> +	u32 tx_rear;
> +	u32 tx_front;
> +	u32 tx_base;
> +	u32 qlen;
> +	u32 mlen;
> +	u32 reserved2[2];
> +	u32 polling;

Why are you storing addresses as u32? Shouldn't these be __iomem*?

I also cannot find any piece of code setting several of above, e.g. tx_base

> +};
> +
> +/**
> + * struct exynos_acpm_queue - exynos acpm queue.
> + *
> + * @rear:	rear address of the queue.
> + * @front:	front address of the queue.
> + * @base:	base address of the queue.
> + */
> +struct exynos_acpm_queue {
> +	void __iomem *rear;
> +	void __iomem *front;
> +	void __iomem *base;
> +};
> +
> +/**
> + * struct exynos_acpm_rx_data - RX queue data.
> + *
> + * @cmd:	pointer to where the data shall be saved.
> + * @response:	true if the client expects the RX data.
> + */
> +struct exynos_acpm_rx_data {
> +	u32 *cmd;
> +	bool response;
> +};
> +
> +#define EXYNOS_ACPM_SEQNUM_MAX    64
> +

...


> +	if (IS_ERR(work_data))
> +		return PTR_ERR(work_data);
> +
> +	spin_lock_irqsave(&chan->tx_lock, flags);
> +
> +	tx_front = readl_relaxed(chan->tx.front);
> +	idx = (tx_front + 1) % chan->qlen;
> +
> +	ret = exynos_acpm_wait_for_queue_slots(mbox_chan, idx);
> +	if (ret)
> +		goto exit;
> +
> +	exynos_acpm_prepare_request(mbox_chan, req);
> +
> +	/* Write TX command. */
> +	__iowrite32_copy(chan->tx.base + chan->mlen * tx_front, tx->cmd,
> +			 req->txlen / 4);
> +
> +	/* Advance TX front. */
> +	writel_relaxed(idx, chan->tx.front);
> +
> +	/* Flush SRAM posted writes. */
> +	readl_relaxed(chan->tx.front);
> +

How does this flush work? Maybe you just miss here barries (s/relaxed//)?

> +	/* Generate ACPM interrupt. */
> +	writel_relaxed(BIT(chan->id), exynos_acpm->regs + EXYNOS_ACPM_INTGR1);
> +
> +	/* Flush mailbox controller posted writes. */
> +	readl_relaxed(exynos_acpm->regs + EXYNOS_ACPM_MCUCTRL);
> +
> +	spin_unlock_irqrestore(&chan->tx_lock, flags);
> +
> +	queue_work(exynos_acpm->wq, &work_data->work);
> +
> +	return -EINPROGRESS;
> +exit:
> +	spin_unlock_irqrestore(&chan->tx_lock, flags);
> +	kfree(work_data);
> +	return ret;
> +}
> +
> +static int exynos_acpm_chan_startup(struct mbox_chan *mbox_chan)
> +{
> +	struct exynos_acpm_chan *chan = mbox_chan->con_priv;
> +
> +	if (!chan->polling) {
> +		dev_err(mbox_chan->mbox->dev, "IRQs not supported.\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct mbox_chan_ops exynos_acpm_chan_ops = {
> +	.send_request = exynos_acpm_send_request,
> +	.startup = exynos_acpm_chan_startup,
> +};
> +
> +static void __iomem *exynos_acpm_get_iomem_addr(void __iomem *base,
> +						void __iomem *addr)
> +{
> +	u32 offset;
> +
> +	offset = readl_relaxed(addr);
> +	return base + offset;
> +}
> +
> +static void exynos_acpm_rx_queue_init(struct exynos_acpm *exynos_acpm,
> +				      struct exynos_acpm_shmem_chan *shmem_chan,
> +				      struct exynos_acpm_queue *rx)
> +{
> +	void __iomem *base = exynos_acpm->sram_base;
> +
> +	rx->base = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_base);
> +	rx->front = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_front);
> +	rx->rear = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_rear);
> +}
> +
> +static void exynos_acpm_tx_queue_init(struct exynos_acpm *exynos_acpm,
> +				      struct exynos_acpm_shmem_chan *shmem_chan,
> +				      struct exynos_acpm_queue *tx)
> +{
> +	void __iomem *base = exynos_acpm->sram_base;
> +
> +	tx->base = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_base);
> +	tx->front = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_front);
> +	tx->rear = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_rear);
> +}
> +
> +static int exynos_acpm_alloc_cmds(struct exynos_acpm *exynos_acpm,
> +				  struct exynos_acpm_chan *chan)
> +{
> +	struct device *dev = exynos_acpm->dev;
> +	struct exynos_acpm_rx_data *rx_data;
> +	unsigned int mlen = chan->mlen;
> +	int i;
> +
> +	for (i = 0; i < EXYNOS_ACPM_SEQNUM_MAX; i++) {
> +		rx_data = &chan->rx_data[i];
> +		rx_data->cmd = devm_kcalloc(dev, mlen, sizeof(*(rx_data->cmd)),
> +					    GFP_KERNEL);
> +		if (!rx_data->cmd)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int exynos_acpm_chans_init(struct exynos_acpm *exynos_acpm)
> +{
> +	struct exynos_acpm_shmem_chan *shmem_chans, *shmem_chan;
> +	struct exynos_acpm_shmem *shmem = exynos_acpm->shmem;
> +	struct mbox_chan *mbox_chan, *mbox_chans;
> +	struct exynos_acpm_chan *chan, *chans;
> +	struct device *dev = exynos_acpm->dev;
> +	int i, ret;
> +
> +	exynos_acpm->num_chans = readl_relaxed(&shmem->num_chans);
> +
> +	mbox_chans = devm_kcalloc(dev, exynos_acpm->num_chans,
> +				  sizeof(*mbox_chans), GFP_KERNEL);
> +	if (!mbox_chans)
> +		return -ENOMEM;
> +
> +	chans = devm_kcalloc(dev, exynos_acpm->num_chans, sizeof(*chans),
> +			     GFP_KERNEL);
> +	if (!chans)
> +		return -ENOMEM;
> +
> +	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
> +						 &shmem->chans);
> +
> +	for (i = 0; i < exynos_acpm->num_chans; i++) {
> +		shmem_chan = &shmem_chans[i];
> +		mbox_chan = &mbox_chans[i];
> +		chan = &chans[i];
> +
> +		/* Set parameters for the mailbox channel. */
> +		mbox_chan->con_priv = chan;
> +		mbox_chan->mbox = exynos_acpm->mbox;
> +
> +		/* Set parameters for the ACPM channel. */
> +		chan->mlen = readl_relaxed(&shmem_chan->mlen);
> +
> +		ret = exynos_acpm_alloc_cmds(exynos_acpm, chan);
> +		if (ret)
> +			return ret;
> +
> +		chan->polling = readl_relaxed(&shmem_chan->polling);
> +		chan->id = readl_relaxed(&shmem_chan->id);
> +		chan->qlen = readl_relaxed(&shmem_chan->qlen);
> +
> +		exynos_acpm_rx_queue_init(exynos_acpm, shmem_chan, &chan->rx);
> +		exynos_acpm_tx_queue_init(exynos_acpm, shmem_chan, &chan->tx);
> +
> +		mutex_init(&chan->rx_lock);
> +		spin_lock_init(&chan->tx_lock);
> +
> +		dev_vdbg(dev, "ID = %d poll = %d, mlen = %d, qlen = %d\n",
> +			 chan->id, chan->polling, chan->mlen, chan->qlen);
> +	}
> +
> +	/* Save pointers to the ACPM and mailbox channels. */
> +	exynos_acpm->mbox->chans = mbox_chans;
> +	exynos_acpm->chans = chans;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id exynos_acpm_match[] = {
> +	{ .compatible = "google,gs101-acpm" },

Where are the bindings?

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, exynos_acpm_match);
> +
> +static int exynos_acpm_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct exynos_acpm *exynos_acpm;
> +	struct mbox_controller *mbox;
> +	struct device_node *shmem;
> +	resource_size_t size;
> +	struct resource res;
> +	const __be32 *prop;
> +	int ret;
> +
> +	exynos_acpm = devm_kzalloc(dev, sizeof(*exynos_acpm), GFP_KERNEL);
> +	if (!exynos_acpm)
> +		return -ENOMEM;
> +
> +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	exynos_acpm->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(exynos_acpm->regs))
> +		return PTR_ERR(exynos_acpm->regs);
> +
> +	shmem = of_parse_phandle(node, "shmem", 0);
> +	ret = of_address_to_resource(shmem, 0, &res);
> +	of_node_put(shmem);
> +	if (ret) {
> +		dev_err(dev, "Failed to get shared memory.\n");
> +		return ret;
> +	}
> +
> +	size = resource_size(&res);
> +	exynos_acpm->sram_base = devm_ioremap(dev, res.start, size);
> +	if (!exynos_acpm->sram_base) {
> +		dev_err(dev, "Failed to ioremap shared memory.\n");
> +		return -ENOMEM;
> +	}
> +
> +	prop = of_get_property(node, "initdata-base", NULL);
> +	if (!prop) {
> +		dev_err(dev, "Parsing initdata_base failed.\n");
> +		return -EINVAL;
> +	}
> +
> +	exynos_acpm->pclk = devm_clk_get(dev, "pclk");

devm_clk_get_enabled

> +	if (IS_ERR(exynos_acpm->pclk)) {
> +		dev_err(dev, "Missing peripheral clock.\n");

return dev_err_probe()

> +		return PTR_ERR(exynos_acpm->pclk);
> +	}
> +
> +	ret = clk_prepare_enable(exynos_acpm->pclk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable the peripheral clock.\n");
> +		return ret;
> +	}
> +
> +	exynos_acpm->wq = alloc_workqueue("exynos-acpm-wq", 0, 0);
> +	if (!exynos_acpm->wq)
> +		return -ENOMEM;
> +
> +	exynos_acpm->dev = dev;
> +	exynos_acpm->mbox = mbox;
> +	exynos_acpm->shmem = exynos_acpm->sram_base + be32_to_cpup(prop);
> +
> +	ret = exynos_acpm_chans_init(exynos_acpm);
> +	if (ret)
> +		return ret;
> +
> +	mbox->num_chans = exynos_acpm->num_chans;
> +	mbox->dev = dev;
> +	mbox->ops = &exynos_acpm_chan_ops;
> +
> +	platform_set_drvdata(pdev, exynos_acpm);
> +
> +	/* Mask out all interrupts. We support just polling channels for now. */
> +	writel_relaxed(EXYNOS_ACPM_INTMR0_MASK,
> +		       exynos_acpm->regs + EXYNOS_ACPM_INTMR0);
> +
> +	ret = devm_mbox_controller_register(dev, mbox);
> +	if (ret)
> +		dev_err(dev, "Failed to register mbox_controller(%d).\n", ret);
> +
> +	return ret;
> +}
> +
> +static void exynos_acpm_remove(struct platform_device *pdev)
> +{
> +	struct exynos_acpm *exynos_acpm = platform_get_drvdata(pdev);
> +
> +	flush_workqueue(exynos_acpm->wq);
> +	destroy_workqueue(exynos_acpm->wq);
> +	clk_disable_unprepare(exynos_acpm->pclk);
> +}
> +
> +static struct platform_driver exynos_acpm_driver = {
> +	.probe	= exynos_acpm_probe,
> +	.remove = exynos_acpm_remove,
> +	.driver	= {
> +		.name = "exynos-acpm",
> +		.owner	= THIS_MODULE,

Drop

> +		.of_match_table	= exynos_acpm_match,
> +	},
> +};
> +module_platform_driver(exynos_acpm_driver);

Best regards,
Krzysztof

