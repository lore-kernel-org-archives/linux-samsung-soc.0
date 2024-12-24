Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC3C42A8B;
	Tue, 24 Dec 2024 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735049675; cv=none; b=Lk094Vfz7p3Ywl+N4hQ+0pJmwUe5Wxiieq1v1g+PD5vgQztdVnusI/E3GYxNJ0o+DywrCRwyy9/4V4v0BJfro9YnHlewvX9utYWs2NATVqVyQ2hrT0Kj+LMtZNe/Uf1VXNA8EotZhUXVW8tbnGNeW2xFnBhZ8xbOgIlE2obOcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735049675; c=relaxed/simple;
	bh=94W8D73GHebbtDKKlXyZQy+wwyN3w1d61TEUBTy7//Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHeZu+lr5rrVNut/57DaO1ggtv2hGfa6ECGdMEi34tQL4Zp/LyrM6+MdHEQViU+0Ae3WkVisb2h1Fo38EHn+2h5rSr8ghUbCCBllKOdwkHq3qSr1MsWu29acN7Tbb6jPiEyolGPlsmQNrMcaX52AeYxLNY2JIP/yE9J4t5oVYD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAGY1zcs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAGY1zcs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2012C4CED0;
	Tue, 24 Dec 2024 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735049674;
	bh=94W8D73GHebbtDKKlXyZQy+wwyN3w1d61TEUBTy7//Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SAGY1zcs2gU0v54gRhkgO2HjTmzcaGgi0JiQ6FUf6YaF9aJ2CXhSVvQ+pi36FTr2h
	 pYKYiy4+3c08ZBtz6qZJMB/S4NT94EN/GQIBHUxpOsvD37cUq0KM3s1+NQh0HmAID9
	 g6ar8VjC8UNnrPwGyXFBt3FFgPsL0U7O2z9BPSdAmVyp6vFn/InJQvTVd9JVVPPyLh
	 xiwJa3x75ZcY1+ajEWZoJzbNj0aIzBdzNdYHNPx9dEcFpwYvj6O4YXURHhqv0ZZ3Xl
	 x9j3vqeUdo2+eV3WO8vjqA+GYcz9VA76r3CUOg23MwschUbxKbF7EhjMhw9Ez8VJKs
	 w1aKE2H8d2afA==
Message-ID: <8e6bade0-5184-4bf7-b1f0-103a77d0f98b@kernel.org>
Date: Tue, 24 Dec 2024 15:14:27 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] firmware: add Exynos ACPM protocol driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-2-4f26b7fb3f5f@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241220-gs101-acpm-v5-2-4f26b7fb3f5f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2024 15:32, Tudor Ambarus wrote:
> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
> new file mode 100644
> index 000000000000..750b41342174
> --- /dev/null
> +++ b/drivers/firmware/samsung/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config EXYNOS_ACPM_PROTOCOL
> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
> +	depends on ARCH_EXYNOS || COMPILE_TEST
> +	depends on EXYNOS_MBOX

Is it build time dependency? No || COMPILE_TEST?

Is it fine when EXYNOS_MBOX is a module?

> +	help
> +	  Alive Clock and Power Manager (ACPM) Message Protocol is defined for
> +	  the purpose of communication between the ACPM firmware and masters
> +	  (AP, AOC, ...). ACPM firmware operates on the Active Power Management
> +	  (APM) module that handles overall power activities.
> +
> +	  This protocol driver provides interface for all the client drivers
> +	  making use of the features offered by the APM.
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
> new file mode 100644
> index 000000000000..7b4c9f6f34f5
> --- /dev/null
> +++ b/drivers/firmware/samsung/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
> +obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> new file mode 100644
> index 000000000000..d698e5a03630
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2024 Linaro Ltd.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/ktime.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +#include "exynos-acpm.h"
> +#include "exynos-acpm-pmic.h"
> +
> +#define ACPM_PMIC_CHANNEL		GENMASK(15, 12)
> +#define ACPM_PMIC_TYPE			GENMASK(11, 8)
> +#define ACPM_PMIC_REG			GENMASK(7, 0)
> +
> +#define ACPM_PMIC_RETURN		GENMASK(31, 24)
> +#define ACPM_PMIC_MASK			GENMASK(23, 16)
> +#define ACPM_PMIC_VALUE			GENMASK(15, 8)
> +#define ACPM_PMIC_FUNC			GENMASK(7, 0)
> +
> +#define ACPM_PMIC_BULK_SHIFT		8
> +#define ACPM_PMIC_BULK_MASK		GENMASK(7, 0)
> +#define ACPM_PMIC_BULK_MAX_COUNT	8
> +
> +enum exynos_acpm_pmic_func {
> +	ACPM_PMIC_READ,
> +	ACPM_PMIC_WRITE,
> +	ACPM_PMIC_UPDATE,
> +	ACPM_PMIC_BULK_READ,
> +	ACPM_PMIC_BULK_WRITE,
> +};
> +
> +static inline u32 acpm_pmic_set_bulk(u32 data, unsigned int i)
> +{
> +	return (data & ACPM_PMIC_BULK_MASK) << (ACPM_PMIC_BULK_SHIFT * i);
> +}
> +
> +static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
> +{
> +	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
> +}
> +
> +static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd,
> +			       int acpm_chan_id)
> +{
> +	xfer->tx.cmd = cmd;
> +	xfer->tx.len = sizeof(cmd);
> +	xfer->rx.cmd = cmd;
> +	xfer->rx.len = sizeof(cmd);
> +	xfer->acpm_chan_id = acpm_chan_id;
> +}
> +
> +static void acpm_pmic_init_read_cmd(u32 *cmd, u8 type, u8 reg, u8 chan)
> +{
> +	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
> +		 FIELD_PREP(ACPM_PMIC_REG, reg) |
> +		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
> +	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_READ);
> +	cmd[3] = ktime_to_ms(ktime_get());
> +}
> +
> +int acpm_pmic_read_reg(const struct acpm_handle *handle, int acpm_chan_id,
> +		       u8 type, u8 reg, u8 chan, u8 *dest)
> +{
> +	struct acpm_xfer xfer;
> +	u32 cmd[4] = {0};
> +	int ret;
> +
> +	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
> +	acpm_dvfs_set_xfer(&xfer, cmd, acpm_chan_id);
> +
> +	ret = acpm_do_xfer(handle, &xfer);
> +	if (ret)
> +		return ret;
> +
> +	*dest = FIELD_GET(ACPM_PMIC_VALUE, xfer.rx.cmd[1]);
> +
> +	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
> +}
> +
> +static void acpm_pmic_init_bulk_read_cmd(u32 *cmd, u8 type, u8 reg, u8 chan,
> +					 u8 count)
> +{
> +	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
> +		 FIELD_PREP(ACPM_PMIC_REG, reg) |
> +		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
> +	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_BULK_READ) |
> +		 FIELD_PREP(ACPM_PMIC_VALUE, count);
> +}
> +
> +int acpm_pmic_bulk_read(const struct acpm_handle *handle, int acpm_chan_id,
> +			u8 type, u8 reg, u8 chan, u8 count, u8 *buf)
> +{
> +	struct acpm_xfer xfer;
> +	u32 cmd[4] = {0};
> +	int i, ret;
> +
> +	if (count > ACPM_PMIC_BULK_MAX_COUNT)
> +		return -EINVAL;
> +
> +	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
> +	acpm_dvfs_set_xfer(&xfer, cmd, acpm_chan_id);
> +
> +	ret = acpm_do_xfer(handle, &xfer);
> +	if (ret)
> +		return ret;
> +
> +	ret = FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < count; i++) {
> +		if (i < 4)
> +			buf[i] = acpm_pmic_get_bulk(xfer.rx.cmd[2], i);
> +		else
> +			buf[i] = acpm_pmic_get_bulk(xfer.rx.cmd[3], i - 4);
> +	}
> +
> +	return 0;
> +}
> +
> +static void acpm_pmic_init_write_cmd(u32 *cmd, u8 type, u8 reg, u8 chan,
> +				     u8 value)
> +{
> +	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
> +		 FIELD_PREP(ACPM_PMIC_REG, reg) |
> +		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
> +	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_WRITE) |
> +		 FIELD_PREP(ACPM_PMIC_VALUE, value);
> +	cmd[3] = ktime_to_ms(ktime_get());
> +}
> +
> +int acpm_pmic_write_reg(const struct acpm_handle *handle, int acpm_chan_id,
> +			u8 type, u8 reg, u8 chan, u8 value)
> +{
> +	struct acpm_xfer xfer;
> +	u32 cmd[4] = {0};
> +	int ret;
> +
> +	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
> +	acpm_dvfs_set_xfer(&xfer, cmd, acpm_chan_id);
> +
> +	ret = acpm_do_xfer(handle, &xfer);
> +	if (ret)
> +		return ret;
> +
> +	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
> +}
> +
> +static void acpm_pmic_init_bulk_write_cmd(u32 *cmd, u8 type, u8 reg, u8 chan,
> +					  u8 count, u8 *buf)

u32 cmd[4] - I think newer GCC could use of that. At least reader will know.

const u8 *buf

Same in all other places, where applicable

> +{
> +	int i;
> +
> +	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
> +		 FIELD_PREP(ACPM_PMIC_REG, reg) |
> +		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
> +	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_BULK_WRITE) |
> +		 FIELD_PREP(ACPM_PMIC_VALUE, count);
> +
> +	for (i = 0; i < count; i++) {
> +		if (i < 4)
> +			cmd[2] |= acpm_pmic_set_bulk(buf[i], i);
> +		else
> +			cmd[3] |= acpm_pmic_set_bulk(buf[i], i - 4);
> +	}
> +}
> +
> +int acpm_pmic_bulk_write(const struct acpm_handle *handle, int acpm_chan_id,
> +			 u8 type, u8 reg, u8 chan, u8 count, u8 *buf)


const u8 *buf

> +{
> +	struct acpm_xfer xfer;
> +	u32 cmd[4] = {0};
> +	int ret;
> +
> +	if (count > ACPM_PMIC_BULK_MAX_COUNT)
> +		return -EINVAL;
> +
> +	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
> +	acpm_dvfs_set_xfer(&xfer, cmd, acpm_chan_id);
> +
> +	ret = acpm_do_xfer(handle, &xfer);
> +	if (ret)
> +		return ret;
> +
> +	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
> +}
> +
> +static void acpm_pmic_init_update_cmd(u32 *cmd, u8 type, u8 reg, u8 chan,
> +				      u8 value, u8 mask)
> +{
> +	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
> +		 FIELD_PREP(ACPM_PMIC_REG, reg) |
> +		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
> +	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_UPDATE) |
> +		 FIELD_PREP(ACPM_PMIC_VALUE, value) |
> +		 FIELD_PREP(ACPM_PMIC_MASK, mask);
> +	cmd[3] = ktime_to_ms(ktime_get());
> +}
> +
> +int acpm_pmic_update_reg(const struct acpm_handle *handle, int acpm_chan_id,
> +			 u8 type, u8 reg, u8 chan, u8 value, u8 mask)
> +{
> +	struct acpm_xfer xfer;
> +	u32 cmd[4] = {0};
> +	int ret;
> +
> +	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
> +	acpm_dvfs_set_xfer(&xfer, cmd, acpm_chan_id);
> +
> +	ret = acpm_do_xfer(handle, &xfer);
> +	if (ret)
> +		return ret;
> +
> +	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
> +}

I have troubles understanding the split. I would assume PMIC uses the
ACPM to talk with PMIC... or somehow the opposite, but here this is all
mixed. You have acpm_pmic_update_reg() which uses  ACPM code
(acpm_do_xfer()), but ACPM code also references acpm_pmic_update_reg()
and others. This is a circular dependency between objects, which
compiles and works fine but is confusing.

> +
> +MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
> +MODULE_DESCRIPTION("Samsung Exynos ACPM mailbox PMIC protocol driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.h b/drivers/firmware/samsung/exynos-acpm-pmic.h
> new file mode 100644
> index 000000000000..92b1997d9933
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2024 Linaro Ltd.
> + */
> +#ifndef __EXYNOS_ACPM_PMIC_H__
> +#define __EXYNOS_ACPM_PMIC_H__
> +
> +#include <linux/types.h>
> +
> +struct acpm_handle;
> +
> +int acpm_pmic_read_reg(const struct acpm_handle *handle, int acpm_chan_id,
> +		       u8 type, u8 reg, u8 chan, u8 *dest);
> +int acpm_pmic_bulk_read(const struct acpm_handle *handle, int acpm_chan_id,
> +			u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
> +int acpm_pmic_write_reg(const struct acpm_handle *handle, int acpm_chan_id,
> +			u8 type, u8 reg, u8 chan, u8 value);
> +int acpm_pmic_bulk_write(const struct acpm_handle *handle, int acpm_chan_id,
> +			 u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
> +int acpm_pmic_update_reg(const struct acpm_handle *handle, int acpm_chan_id,
> +			 u8 type, u8 reg, u8 chan, u8 value, u8 mask);
> +#endif /* __EXYNOS_ACPM_PMIC_H__ */
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> new file mode 100644
> index 000000000000..2f98306f8325
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -0,0 +1,805 @@
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
> +#include <linux/delay.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/math.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

This looks unused

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include "exynos-acpm.h"
> +#include "exynos-acpm-pmic.h"
> +
> +#define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
> +
> +/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
> +#define ACPM_POLL_TIMEOUT		5000
> +#define ACPM_TX_TIMEOUT_US		500000
> +
> +#define ACPM_GS101_INITDATA_BASE	0xa000
> +
> +/**
> + * struct acpm_shmem - shared memory configuration information.
> + * @reserved:	unused fields.
> + * @chans:	offset to array of struct acpm_chan_shmem.
> + * @reserved1:	unused fields.
> + * @num_chans:	number of channels.
> + */
> +struct acpm_shmem {
> +	u32 reserved[2];
> +	u32 chans;
> +	u32 reserved1[3];
> +	u32 num_chans;
> +};
> +
> +/**
> + * struct acpm_chan_shmem - descriptor of a shared memory channel.
> + *
> + * @id:			channel ID.
> + * @reserved:		unused fields.
> + * @rx_rear:		rear pointer of APM RX queue (TX for AP).
> + * @rx_front:		front pointer of APM RX queue (TX for AP).
> + * @rx_base:		base address of APM RX queue (TX for AP).
> + * @reserved1:		unused fields.
> + * @tx_rear:		rear pointer of APM TX queue (RX for AP).
> + * @tx_front:		front pointer of APM TX queue (RX for AP).
> + * @tx_base:		base address of APM TX queue (RX for AP).
> + * @qlen:		queue length. Applies to both TX/RX queues.
> + * @mlen:		message length. Applies to both TX/RX queues.
> + * @reserved2:		unused fields.
> + * @poll_completion:	true when the channel works on polling.
> + */
> +struct acpm_chan_shmem {
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
> +	u32 poll_completion;
> +};
> +
> +/**
> + * struct acpm_queue - exynos acpm queue.
> + *
> + * @rear:	rear address of the queue.
> + * @front:	front address of the queue.
> + * @base:	base address of the queue.
> + */
> +struct acpm_queue {
> +	void __iomem *rear;
> +	void __iomem *front;
> +	void __iomem *base;
> +};
> +
> +/**
> + * struct acpm_rx_data - RX queue data.
> + *
> + * @cmd:	pointer to where the data shall be saved.
> + * @n_cmd:	number of 32-bit commands.
> + * @response:	true if the client expects the RX data.
> + */
> +struct acpm_rx_data {
> +	u32 *cmd;
> +	size_t n_cmd;
> +	bool response;
> +};
> +
> +#define ACPM_SEQNUM_MAX    64
> +
> +/**
> + * struct acpm_chan - driver internal representation of a channel.
> + * @cl:		mailbox client.
> + * @chan:	mailbox channel.
> + * @acpm:	pointer to driver private data.
> + * @tx:		TX queue. The enqueue is done by the host.
> + *			- front index is written by the host.
> + *			- rear index is written by the firmware.
> + *
> + * @rx:		RX queue. The enqueue is done by the firmware.
> + *			- front index is written by the firmware.
> + *			- rear index is written by the host.
> + * @tx_lock:	protects TX queue.
> + * @rx_lock:	protects RX queue.
> + * @qlen:	queue length. Applies to both TX/RX queues.
> + * @mlen:	message length. Applies to both TX/RX queues.
> + * @seqnum:	sequence number of the last message enqueued on TX queue.
> + * @id:		channel ID.
> + * @poll_completion:	indicates if the transfer needs to be polled for
> + *			completion or interrupt mode is used.
> + * @bitmap_seqnum: bitmap that tracks the messages on the TX/RX queues.
> + * @rx_data:	internal buffer used to drain the RX queue.
> + */
> +struct acpm_chan {
> +	struct mbox_client cl;
> +	struct mbox_chan *chan;
> +	struct acpm_info *acpm;
> +	struct acpm_queue tx;
> +	struct acpm_queue rx;
> +	struct mutex tx_lock;
> +	struct mutex rx_lock;
> +
> +	unsigned int qlen;
> +	unsigned int mlen;
> +	u8 seqnum;
> +	u8 id;
> +	bool poll_completion;
> +
> +	DECLARE_BITMAP(bitmap_seqnum, ACPM_SEQNUM_MAX - 1);
> +	struct acpm_rx_data rx_data[ACPM_SEQNUM_MAX];
> +};
> +
> +/**
> + * struct acpm_info - driver's private data.
> + * @shmem:	pointer to the SRAM configuration data.
> + * @sram_base:	base address of SRAM.
> + * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
> + * @dev:	pointer to the exynos-acpm device.
> + * @handle:	instance of acpm_handle to send to clients.
> + * @node:	list head
> + * @num_chans:	number of channels available for this controller.
> + * @users:	number of users of this instance.
> + */
> +struct acpm_info {
> +	struct acpm_shmem __iomem *shmem;
> +	void __iomem *sram_base;
> +	struct acpm_chan *chans;
> +	struct device *dev;
> +	struct acpm_handle handle;
> +	struct list_head node;
> +	u32 num_chans;
> +	/* protected by acpm_list_mutex */
> +	int users;
> +};
> +
> +/**
> + * struct acpm_match_data - of_device_id data.
> + * @initdata_base:	offset in SRAM where the channels configuration resides.
> + */
> +struct acpm_match_data {
> +	loff_t initdata_base;
> +};
> +
> +#define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
> +#define handle_to_acpm_info(h) container_of(h, struct acpm_info, handle)
> +
> +/* List of all ACPM devices active in system */
> +static LIST_HEAD(acpm_list);
> +/* Protection for the entire list */
> +static DEFINE_MUTEX(acpm_list_mutex);
> +
> +static inline void acpm_memcpy_fromio32(void *to, const void __iomem *from,
> +					size_t count)
> +{
> +	WARN_ON(!IS_ALIGNED((unsigned long)from, 4) ||
> +		!IS_ALIGNED((unsigned long)to, 4) ||
> +		count % 4);

These should be build time checks if this is necessary.

> +
> +	__ioread32_copy(to, from, count / 4);
> +}
> +
> +static inline void acpm_memcpy_toio32(void __iomem *to, const void *from,
> +				      size_t count)
> +{
> +	WARN_ON(!IS_ALIGNED((unsigned long)to, 4) ||
> +		!IS_ALIGNED((unsigned long)from, 4) ||
> +		count % 4);
> +
> +	__iowrite32_copy(to, from, count / 4);
> +}


...

> +
> +/**
> + * acpm_prepare_xfer() - prepare a transfer before writing the message to the
> + * TX queue.
> + * @achan:	ACPM channel info.
> + * @xfer:	reference to the transfer being prepared.
> + */
> +static void acpm_prepare_xfer(struct acpm_chan *achan, struct acpm_xfer *xfer)
> +{
> +	struct acpm_msg *tx = &xfer->tx;
> +	struct acpm_rx_data *rx_data;
> +
> +	/* Prevent chan->seqnum from being re-used */
> +	do {
> +		if (++achan->seqnum == ACPM_SEQNUM_MAX)
> +			achan->seqnum = 1;
> +	} while (test_bit(achan->seqnum - 1, achan->bitmap_seqnum));
> +
> +	tx->cmd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
> +
> +	/* Clear data for upcoming responses */
> +	rx_data = &achan->rx_data[achan->seqnum - 1];
> +	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
> +	if (xfer->rx.cmd)
> +		rx_data->response = true;
> +
> +	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
> +	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
> +}
> +
> +/**
> + * acpm_wait_for_message_response - an helper to group all possible ways of
> + * waiting for a synchronous message response.
> + *
> + * @achan:	ACPM channel info.
> + * @xfer:	reference to the transfer being waited for.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int acpm_wait_for_message_response(struct acpm_chan *achan,
> +					  struct acpm_xfer *xfer)
> +{
> +	/* Just polling mode supported for now. */
> +	return acpm_dequeue_by_polling(achan, xfer);
> +}
> +
> +/**
> + * acpm_do_xfer() - do one transfer.
> + * @handle:	pointer to the acpm handle.
> + * @xfer:	transfer to initiate and wait for response.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int acpm_do_xfer(const struct acpm_handle *handle, struct acpm_xfer *xfer)

const xfer, so it is clear that caller keeps ownership and must ensure
it is valid memory through entire xfer time.

> +{
> +	struct acpm_info *acpm = handle_to_acpm_info(handle);
> +	struct acpm_chan *achan = &acpm->chans[xfer->acpm_chan_id];
> +	struct acpm_msg *tx = &xfer->tx;

Looks like const, same for function argument xfer

> +	u32 idx, tx_front;
> +	int ret;
> +
> +	if (!tx->cmd || tx->len > achan->mlen || xfer->rx.len > achan->mlen)
> +		return -EINVAL;
> +
> +	if (!achan->poll_completion) {
> +		dev_err(achan->acpm->dev, "Interrupt mode not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	mutex_lock(&achan->tx_lock);
> +
> +	tx_front = readl(achan->tx.front);
> +	idx = (tx_front + 1) % achan->qlen;
> +
> +	ret = acpm_wait_for_queue_slots(achan, idx);
> +	if (ret) {
> +		mutex_unlock(&achan->tx_lock);
> +		return ret;
> +	}
> +
> +	acpm_prepare_xfer(achan, xfer);
> +
> +	/* Write TX command. */
> +	acpm_memcpy_toio32(achan->tx.base + achan->mlen * tx_front, tx->cmd,
> +			   tx->len);
> +
> +	/* Advance TX front. */
> +	writel(idx, achan->tx.front);
> +
> +	mutex_unlock(&achan->tx_lock);

Just to be sure I understand correctly:
If concurrent transfer happened exactly now, it would use incremented
tx_front, thus it would not overwrite data written here, right?


> +
> +	ret = mbox_send_message(achan->chan, xfer);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = acpm_wait_for_message_response(achan, xfer);
> +
> +	/*
> +	 * NOTE: we might prefer not to need the mailbox ticker to manage the
> +	 * transfer queueing since the protocol layer queues things by itself.
> +	 * Unfortunately, we have to kick the mailbox framework after we have
> +	 * received our message.
> +	 */
> +	mbox_client_txdone(achan->chan, ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * acpm_put_handle() - release the handle acquired by acpm_get_by_phandle.
> + * @handle:	Handle acquired by acpm_get_by_phandle.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int acpm_put_handle(const struct acpm_handle *handle)
> +{
> +	struct acpm_info *acpm;
> +
> +	if (IS_ERR(handle))
> +		return PTR_ERR(handle);
> +	if (!handle)
> +		return -EINVAL;

I think this cannot happen and you should rather choose: either NULL is
allowed or PTR_ERR, but not both. Although in few cases both ERR and
NULL are desired, so write a comment why here.

> +
> +	acpm = handle_to_acpm_info(handle);
> +	mutex_lock(&acpm_list_mutex);
> +	if (!WARN_ON(!acpm->users))
> +		acpm->users--;

Use refcnt

> +	mutex_unlock(&acpm_list_mutex);
> +
> +	return 0;
> +}
> +
> +/**
> + * devm_acpm_release() - devres release method.
> + * @dev: pointer to device.
> + * @res: pointer to resource.
> + */
> +static void devm_acpm_release(struct device *dev, void *res)
> +{
> +	const struct acpm_handle **ptr = res;
> +	const struct acpm_handle *handle = *ptr;
> +	int ret;
> +
> +	ret = acpm_put_handle(handle);
> +	if (ret)
> +		dev_err(dev, "failed to put handle %d\n", ret);
> +}
> +
> +/**
> + * acpm_get_by_phandle() - get the ACPM handle using DT phandle.
> + * @np:		device node.
> + * @property:	property name containing phandle on ACPM node.
> + *
> + * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
> + */
> +static const struct acpm_handle *acpm_get_by_phandle(struct device_node *np,
> +						     const char *property)
> +{
> +	struct acpm_handle *handle = NULL;
> +	struct device_node *acpm_np;
> +	struct acpm_info *info;
> +
> +	if (!np) {
> +		pr_err("I need a device pointer\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	acpm_np = of_parse_phandle(np, property, 0);
> +	if (!acpm_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	mutex_lock(&acpm_list_mutex);
> +	list_for_each_entry(info, &acpm_list, node) {
> +		if (acpm_np == info->dev->of_node) {
> +			handle = &info->handle;
> +			info->users++;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&acpm_list_mutex);
> +	of_node_put(acpm_np);
> +

You also need device links and probably try_module_get. See clk.c
clk_hw_create_clk() or of_qcom_ice_get(). Interestingly, none of them
perform both operations, which I think is necessary.

I think you could also avoid entire list and mutex by using
platform_get_drvdata(), see of_qcom_ice_get().


> +	if (!handle)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return handle;
> +}
> +
> +/**
> + * devm_acpm_get_by_phandle() - managed get handle using phandle.
> + * @dev:	device pointer requesting ACPM handle.
> + * @property:	property name containing phandle on ACPM node.
> + *
> + * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
> + */
> +const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
> +						   const char *property)
> +{
> +	const struct acpm_handle *handle;
> +	const struct acpm_handle **ptr;
> +
> +	ptr = devres_alloc(devm_acpm_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +	handle = acpm_get_by_phandle(dev_of_node(dev), property);
> +
> +	if (!IS_ERR(handle)) {
> +		*ptr = handle;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +

...

> +#endif /* __EXYNOS_ACPM_H__ */
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> new file mode 100644
> index 000000000000..f834af20cef8
> --- /dev/null
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2024 Linaro Ltd.
> + */
> +
> +#ifndef __EXYNOS_ACPM_PROTOCOL_H
> +#define __EXYNOS_ACPM_PROTOCOL_H
> +
> +#include <linux/types.h>
> +
> +struct acpm_msg {
> +	u32 *cmd;

const most likely, although then you have different message for tx and
tx. Not sure if there is a benefit of having it as structure.

> +	size_t len;
> +};
> +
> +struct acpm_xfer {
> +	struct acpm_msg tx;
> +	struct acpm_msg rx;
> +	int acpm_chan_id;
> +};
> +
> +struct acpm_handle;
> +
> +struct acpm_pmic_ops {
> +	int (*read_reg)(const struct acpm_handle *handle, int acpm_chan_id,
> +			u8 type, u8 reg, u8 chan, u8 *dest);
> +	int (*bulk_read)(const struct acpm_handle *handle, int acpm_chan_id,
> +			 u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
> +	int (*write_reg)(const struct acpm_handle *handle, int acpm_chan_id,
> +			 u8 type, u8 reg, u8 chan, u8 value);
> +	int (*bulk_write)(const struct acpm_handle *handle, int acpm_chan_id,
> +			  u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
> +	int (*update_reg)(const struct acpm_handle *handle, int acpm_chan_id,
> +			  u8 type, u8 reg, u8 chan, u8 value, u8 mask);
> +};
> +
> +struct acpm_ops {
> +	struct acpm_pmic_ops pmic_ops;
> +};
> +
> +/**
> + * struct acpm_handle - Reference to an initialized protocol instance
> + * @ops:
> + */
> +struct acpm_handle {
> +	struct acpm_ops ops;
> +};

All above should not be in public header but private to the driver. In
public header you expose things available to consumers.... which there
are no? So entire header can be next to the driver.

> +
> +struct device;
> +
> +const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
> +						   const char *property);
> +#endif /* __EXYNOS_ACPM_PROTOCOL_H */
> 


Best regards,
Krzysztof
