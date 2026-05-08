Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCBF2E7BD9
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276877; cv=pass; b=bJB8x5McMx24yNlN1WHGPDQfbaBbusDC8o9l71GMgTQwiUGS7SHq/TG8VODYQ/atTOHm6wG0QmuA0W0q6p87DbgEbPZYJ34xWaMDmgyQOKtFoWkebFZIDB0Jof76cIGYxak/ap9b8HuhyNtZWfFOPCoarO6y1QjdYaFguP4TjlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276877; c=relaxed/simple;
	bh=ILpME/swS5rIapPVAb/p+qxYsMSdedVPf8AJjzXUnu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKdjiy+WvpxWOWYDsq5D9AB7qd6addG3nxjC03h3EqVlaFeX0JR3wBQhqTlY2TlYAz7G8pb1uRnkWnzSF9ojcdIGnIAjwMQwYJxPQ4JlIe1NXz14pXmQjoO4duF/Tsjc2hdj2L4t06WLQ9y2UlnRcO8tgw3CQst5N5KlgyT8zjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=khD5duVL; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khD5duVL"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso984584e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 14:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778276874; cv=none;
        d=google.com; s=arc-20240605;
        b=X8cV4Bc+mYZ9UVXs/EPS0dNfT+zmBiwMbM8onNJkizulHoBW0EHnRfP8wdcPpQy6qV
         qLJ8uQHcIx1dwvK93dThpiSquIaNB/bXaN0w+xCgJyk5BOgjTDwf2kCA++wLRANL3xAp
         eEKDfr4j8ClJwTM8fGARuAh5t3vzCD2S3sNeE4nqERLJChg2SBx6jYMVJYWkvsVn9wG2
         ivb39EPaQDfVpmYiuToqNQBztL7JLri3untuoSGUkXoVAMWW8O1rI/Hv266+/nW47/mI
         Wp/Y2MUn/81yVrNBbsoHPmUE4uSjkCympmXqrSls2a2gMRNvbK2msG0DDB4Ksu7W0ugE
         ckZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        fh=oLwKUVqCySdtexF1WEGFf4CW8NK+ceJLt+0Wa5vqfIk=;
        b=ipS981tf8GTK4BS5uOuDFZ1ATMBcrowNMsMMU5IVllpqK5gf01VogCCTYqoJmtFmhZ
         lqP1xWmQBb8VTRu16y+ita9xrmVVDjUR0QYjmI5aUKkhEBJqtwR6qhdmCV8uQDaP/bFE
         LiqvNPYwCcI4Zuvi3n7tRU6aY7D0IlJr+VZTriLJaMZlgd5NhN39knpMiBrvhgVMR06i
         lA3XU6yjDu7VSzMmR3qErrF4CzIrwNTY0MSHJtugVZkzGHnOoeyEjbu2qCSLxg7ZBcLL
         pJcyRx9oUBPvqZ1BwyebHcElw7hmV+nnqaXj8whWNiltipVKQ8cTpHz+/lofIjvl08Q9
         DY+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778276874; x=1778881674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        b=khD5duVLOBsSWjFm1OB+UFEOef7Xowz6QvG83YCtXcupCvdQlu39gZmKG1LMHEFGlS
         gz8Dnz3TJ3+iYJIGC7N5Rk0lvkZdzdjYbIvWKl0UlbCIYCYJu0izJpusSNRQp0/1M4Xa
         U6DuPxwDR1jex7C14b+tnw3OqFgBJXU015xhDMS0xl/JJzOqs4WbTkzeG0A+Z2CCOQUX
         vCM/ki2NfbgBfNJwd6ZMugmG6GLnbngnb9wYKDD/Zfr7MOPQ3OvV2+V3x3/pxWNsEWoY
         eYFhb05W/m9D4MtPXow55dCur45RQtCkjVRGy0Q12EI0ltOWda6idYdyN8cegr48JMJ9
         jr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276874; x=1778881674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        b=YVUf4F2ux//JPvYcQL+9qSovj0g1a2IKihWhJGGz/tc4iRuxvCQxLBT6AVy+lluvXf
         IkuK8qVCuDQsGwn0f6YXrs59jiSG6Y7Y17Qp/vLmldjy65fX6bGUdVzFpEcEahpgfWLD
         P6I+LVtQhU+GCk8mWktIIbsDcJA/aegXUvDqR1S85corZ40bIZpq9uihN5IC/K7RBeNW
         FeuklT70dS/S1i+3F2pbGiT1wnQz79bHhZr0JYUZKWXppu2GEgL7UWc8XBrsGf3R6z/L
         o4lk/MZpV6gkpqVC2ZfAGlctjFcGZBVv1BD2eD7FIYZu+3XhVbObUJ1ZXlKkEGL9QKQx
         h0Fw==
X-Forwarded-Encrypted: i=1; AFNElJ9nqI2mUKd09RHJfJEZpL28ZzJsUfSdZOn12kcsx/qDE+Cc2JPT2hwu5A93VXu75UyfHGcGl3lEFFKQcQS+R9dycQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Sa4Adl96l099h07OPK45kJTDk2P2yzIIDv0Z+4vRQIPAIu6F
	b5oAZXCITAISFsEMUL91kuqVRWESXgv32YEZD885bBGYKbjjjzgpBq8aPeaGa9BloschAJZW+6m
	u8W+v3z4sx4XjwreclnhHmvY8DPxLm2FVqc8vGlHGPg==
X-Gm-Gg: Acq92OG8z+P/s/xBp7J8fFBtwEHMd9ktzUAZFeaYxmu4CgkLTiYFPpFTrgNnIsV4Hro
	yaZ6r1N69QIsQgNS27M1z/eOWtZSvW1rrbHRa1d+c+KuxfBPrrvZ6ETmm+E2ZGII6ek0phFucyc
	CnqPVX5nE4dF4uy9uTo12Cgek4yo8g2+0Xcb8bSbBi2ofq5oG0QrNiyUTVSB3PPKK/a8LBzwiXs
	7jQHrUTe3aKrK7ZQdcsO8IzJ1NFOasPjl5O6pj26KyvGkKHyGldpqTzSybryNUY6ss1JlCYASfU
	Ztwx3AL6VYI3T5HSju19ckHzg7siPedxY4k8GuySRQ==
X-Received: by 2002:a05:6122:d28:b0:56f:1c32:bd07 with SMTP id
 71dfb90a1353d-57599081e26mr75702e0c.2.1778276874401; Fri, 08 May 2026
 14:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:47:40 +0100
X-Gm-Features: AVHnY4Jx9Y0PnI-yLhX3azc912MHhiYNtX9S94HKUZHkESLUhrPpwLh3zoUEOQU
Message-ID: <CADrjBPr3Piw-sQ043EuwdUZTes-9pxoVP4fA7-AX=ssjvniJcw@mail.gmail.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
> through a hybrid model shared between the kernel and the Alive Clock
> and Power Manager (ACPM) firmware.
>
> Add the protocol helpers required to communicate with the ACPM for
> thermal operations, including initialization, threshold configuration,
> temperature reading, and system suspend/resume handshakes.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>  5 files changed, 298 insertions(+)
>
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
> index 80d4f89b33a9..5a6f72bececf 100644
> --- a/drivers/firmware/samsung/Makefile
> +++ b/drivers/firmware/samsung/Makefile
> @@ -3,4 +3,5 @@
>  acpm-protocol-objs                     := exynos-acpm.o
>  acpm-protocol-objs                     += exynos-acpm-pmic.o
>  acpm-protocol-objs                     += exynos-acpm-dvfs.o
> +acpm-protocol-objs                     += exynos-acpm-tmu.o
>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)     += acpm-protocol.o
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmware/samsung/exynos-acpm-tmu.c
> new file mode 100644
> index 000000000000..c68d60b4c0b3
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2026 Linaro Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/ktime.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include "exynos-acpm.h"
> +#include "exynos-acpm-tmu.h"
> +
> +/* IPC Request Types */
> +#define ACPM_TMU_INIT          0x01
> +#define ACPM_TMU_READ_TEMP     0x02
> +#define ACPM_TMU_SUSPEND       0x04
> +#define ACPM_TMU_RESUME                0x10
> +#define ACPM_TMU_THRESHOLD     0x11
> +#define ACPM_TMU_INTEN         0x12
> +#define ACPM_TMU_CONTROL       0x13
> +#define ACPM_TMU_IRQ_CLEAR     0x14
> +
> +#define ACPM_TMU_TX_DATA_LEN   8
> +#define ACPM_TMU_RX_DATA_LEN   7
> +
> +struct acpm_tmu_tx {
> +       u16 ctx;
> +       u16 fw_use;
> +       u8 type;
> +       u8 rsvd0;
> +       u8 tzid;
> +       u8 rsvd1;
> +       u8 data[ACPM_TMU_TX_DATA_LEN];
> +} __packed;
> +
> +struct acpm_tmu_rx {
> +       u16 ctx;
> +       u16 fw_use;
> +       u8 type;
> +       s8 ret;
> +       u8 tzid;
> +       s8 temp;
> +       u8 rsvd;
> +       u8 data[ACPM_TMU_RX_DATA_LEN];
> +} __packed;
> +
> +union acpm_tmu_msg {
> +       u32 data[4];
> +       struct acpm_tmu_tx tx;
> +       struct acpm_tmu_rx rx;
> +};
> +
> +static int acpm_tmu_to_linux_err(s8 fw_err)
> +{
> +       /*
> +        * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
> +        * capabilities. Treat zero and all positive values as success.
> +        */
> +       if (fw_err >= 0)
> +               return 0;
> +
> +       if (fw_err == -1)
> +               return -EACCES;
> +
> +       return -EIO;
> +}
> +
> +int acpm_tmu_init(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_INIT;
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_read_temp(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                      u8 tz, int *temp)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_READ_TEMP;
> +       msg.tx.tzid = tz;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       ret = acpm_tmu_to_linux_err(msg.rx.ret);
> +       if (ret)
> +               return ret;
> +
> +       *temp = msg.rx.temp;
> +
> +       return 0;
> +}
> +
> +int acpm_tmu_set_threshold(struct acpm_handle *handle,
> +                          unsigned int acpm_chan_id, u8 tz,
> +                          const u8 temperature[8], size_t tlen)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       if (tlen > ACPM_TMU_TX_DATA_LEN)
> +               return -EINVAL;
> +
> +       msg.tx.type = ACPM_TMU_THRESHOLD;
> +       msg.tx.tzid = tz;
> +       memcpy(msg.tx.data, temperature, tlen);
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_set_interrupt_enable(struct acpm_handle *handle,
> +                                 unsigned int acpm_chan_id, u8 tz, u8 inten)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_INTEN;
> +       msg.tx.tzid = tz;
> +       msg.tx.data[0] = inten;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_tz_control(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                       u8 tz, bool enable)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_CONTROL;
> +       msg.tx.tzid = tz;
> +       msg.tx.data[0] = enable ? 1 : 0;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_clear_tz_irq(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_IRQ_CLEAR;
> +       msg.tx.tzid = tz;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_suspend(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_SUSPEND;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_resume(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_RESUME;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.h b/drivers/firmware/samsung/exynos-acpm-tmu.h
> new file mode 100644
> index 000000000000..8b89f29fda67
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2026 Linaro Ltd.
> + */
> +#ifndef __EXYNOS_ACPM_TMU_H__
> +#define __EXYNOS_ACPM_TMU_H__
> +
> +#include <linux/types.h>
> +
> +struct acpm_handle;
> +
> +int acpm_tmu_init(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +int acpm_tmu_read_temp(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                      u8 tz, int *temp);
> +int acpm_tmu_set_threshold(struct acpm_handle *handle,
> +                          unsigned int acpm_chan_id, u8 tz,
> +                          const u8 temperature[8], size_t tlen);
> +int acpm_tmu_set_interrupt_enable(struct acpm_handle *handle,
> +                                 unsigned int acpm_chan_id, u8 tz, u8 inten);
> +int acpm_tmu_tz_control(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                       u8 tz, bool enable);
> +int acpm_tmu_clear_tz_irq(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz);
> +int acpm_tmu_suspend(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +int acpm_tmu_resume(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +#endif /* __EXYNOS_ACPM_TMU_H__ */
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 1a0d98b55439..2cebc5456968 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -33,6 +33,7 @@
>  #include "exynos-acpm.h"
>  #include "exynos-acpm-dvfs.h"
>  #include "exynos-acpm-pmic.h"
> +#include "exynos-acpm-tmu.h"
>
>  #define ACPM_PROTOCOL_SEQNUM           GENMASK(21, 16)
>
> @@ -688,6 +689,17 @@ static const struct acpm_ops exynos_acpm_driver_ops = {
>                 .bulk_write = acpm_pmic_bulk_write,
>                 .update_reg = acpm_pmic_update_reg,
>         },
> +
> +       .tmu = {
> +               .init = acpm_tmu_init,
> +               .read_temp = acpm_tmu_read_temp,
> +               .set_threshold = acpm_tmu_set_threshold,
> +               .set_interrupt_enable = acpm_tmu_set_interrupt_enable,
> +               .tz_control = acpm_tmu_tz_control,
> +               .clear_tz_irq = acpm_tmu_clear_tz_irq,
> +               .suspend = acpm_tmu_suspend,
> +               .resume = acpm_tmu_resume,
> +       },
>  };
>
>  static int acpm_probe(struct platform_device *pdev)
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index fbf1829b33db..08d9f5c95701 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -35,9 +35,27 @@ struct acpm_pmic_ops {
>                           u8 type, u8 reg, u8 chan, u8 value, u8 mask);
>  };
>
> +struct acpm_tmu_ops {
> +       int (*init)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +       int (*read_temp)(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                        u8 tz, int *temp);
> +       int (*set_threshold)(struct acpm_handle *handle,
> +                            unsigned int acpm_chan_id, u8 tz,
> +                            const u8 temperature[8], size_t tlen);
> +       int (*set_interrupt_enable)(struct acpm_handle *handle,
> +                                   unsigned int acpm_chan_id, u8 tz, u8 inten);
> +       int (*tz_control)(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz, bool enable);
> +       int (*clear_tz_irq)(struct acpm_handle *handle,
> +                           unsigned int acpm_chan_id, u8 tz);
> +       int (*suspend)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +       int (*resume)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +};
> +
>  struct acpm_ops {
>         struct acpm_dvfs_ops dvfs;
>         struct acpm_pmic_ops pmic;
> +       struct acpm_tmu_ops tmu;
>  };
>
>  /**
>
> --
> 2.54.0.545.g6539524ca2-goog
>
