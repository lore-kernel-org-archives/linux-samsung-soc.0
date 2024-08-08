Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5838918C349
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126280; cv=none; b=Pr+MLZ+gzzibLjeU3kk9Qekr4TVqhiVXSQ7kahanawmGZBzwLenA+s92iM9IZf45k2HHysXic+DeJCp1HSyS/F5V8lNkLcjE4vp2cEmzPzBgbkE52QQJpkGIKxsr1ctRRPDyb3rsEBf7FbS9VbdqTgbpaeM0dJ3Lgmaul6RgE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126280; c=relaxed/simple;
	bh=95AlyDaddNiZMDEmIhO07GExNxqtyCYVTGs9vpQrW4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K3F9UD2lipasGSI0/BA2E/kFA4bl9eamZUbGeqWBOfSYYbEEUNWuwK/LCSYw+H/ove6qOWCH1FfGf5ZNyhcIZ/ym0Puydfh8uAcoq8aPTSZk58na22uzXhWkFU4B9hk7uk5cxZCI833z+2SV/zej4G/wwLMDG9FvwajDHnSMqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXEuY1x5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXEuY1x5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so1189070a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126277; x=1723731077; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wieDPHjSPi1ZLsan7+O0Z+D8NjoHSP8ahDa0aetrxpk=;
        b=jXEuY1x5jqvkjYo/pjvy57/hMeQsF5QoEm2BXzXtMpl+Vhw9JyAN28KqPe8AaaO1jY
         FXCnF6O1k3psGedbj2U/ynlcMpJjInFoIL051vPDbIFnjxfuCjlTMn68BvwGId3bjT98
         MORRsSBrlS516z0wK0a4yCodInvIzEYSbIYZEmbZCX2NBFzR37ZIGvfNUL3AfBi72YWL
         ecxfpDD9JZrxd9MN96c5YY1YqozVtkkqdPlRVYsoVhIhDkbfgF/SiUpnDYeEKtl8UiXI
         5CFD1yGxEoZxXQ2KGSrfCk881CxXwJV9zrUJFP1uDrOqL2YEhPg8/mgVhY3J20PX1rsx
         KMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126277; x=1723731077;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wieDPHjSPi1ZLsan7+O0Z+D8NjoHSP8ahDa0aetrxpk=;
        b=Fp5OYmyJ7SBKGx6Z8Or3J5ulJcs7MuYw1x/SuLrCZNLlW6mpTIS0QSk2cPO6rIJEle
         8sJW43n9P3PXOTee62iAEbcDXdRhN+vNun6Snha3K8e+Y7TT6G4HBqmSZG6p70DkaTLA
         Uv0ghLyLy7vo5i2pJe26MbHJ7K5swoZzFizVgnFSFohpDzPVYQw8ZdhukZRtLL9VwdX/
         Z7r/HLYYTgBkjrW8ywawYAjthXbBoJzTexUfIR1Ed9nRhZwqOVH2HpLKpETme5H+gSfX
         75rnr5QQ6N70US6OtQCa8S/W+X/Y5+QtobnNx+plnLhamGyncx9iv/UJsJrHmNytnHas
         7sjw==
X-Forwarded-Encrypted: i=1; AJvYcCXyXQJoPcFyjvS+mI3SLi6BmpZ41+IUi7/6iQuJEG3tQGYBWNDW/2Te7RY/kiDXllSE/6brlhovnSws3EAAEBXaNjbCLWTksNsj5BBvXWN8kdA=
X-Gm-Message-State: AOJu0YwTCN9IfxG09mhSFGtA6QMLrlLZ3PlRQJRdm6PH3lwhWgSx/9G5
	cR199F6QgnP8t1fhwQnkVVoQWv3ioarEVExKZRiTmrZTFDEHxs7jE/nDicWS0+A=
X-Google-Smtp-Source: AGHT+IHdqxblFw4szqgN7ofHM/QU50Nzna/i6RgnPnDiQEz7rQf3FzXP5OyidprWJ44HWP8e2NZg+Q==
X-Received: by 2002:a05:6402:11c8:b0:5a0:f8a2:9cf4 with SMTP id 4fb4d7f45d1cf-5bbb2234eacmr1617101a12.25.1723126276628;
        Thu, 08 Aug 2024 07:11:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 00/20] clk: help OF platforms with their stdout
 (earlycon) clocks during early boot
Date: Thu, 08 Aug 2024 15:11:14 +0100
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAALStGYC/4XOsU7DMBCA4VepPHPRne2koRPvgRhc+5JYDTY6R
 xFQ5d1xykCZOv7Lp/+qCkvkok6HqxJeY4k51WifDspPLo0MMdRWGrVFaxDGQkiQcgIuhdMS3Qx
 +zv5SQEPnjO5xcHTmXlXiQ3iInzf+9a32IPkdlknY/aFkEJ9NT7qho+1a0kDgUhBugrjyHS8vc
 0xOcpNl3M0pliXL1+14Nbv86xzpwdxqAKEN/twHtBjI38P73WrvNf1As1UzhI4ZA9uO/2nbtv0
 AZwaD7VsBAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

On at least two plaforms, i.MX and the Exynos-derivative gs101,
earlycon depends on the bootloader setup stdout clocks being retained.
In some cases stdout UART clocks (or their parents) can get disabled
during loading of other drivers (e.g. i2c or UART driver init) causing
earlycon to stop to work sometime into the boot, halting the whole
system, see e.g. [3].

Code exists in the i.MX clock drivers to deal with that by temporarily
bumping the reference count of the relevant stdout clocks during early
boot.

While gs101 doesn't have such code, some UART clocks had been marked
'critical' for a different reason originally, and by accident
worked-around the same problem. v4 of this series proposed addition of
similar code to gs101 to be able to drop the 'critical' flag from its
clocks, but Stephen suggested to move all this into the clk core
instead.

This series now does that:
* instead of duplicating such code to gs101, teaches the clk core to
  deal with stdout clocks during early boot, similar to the existing
  support in i.MX
  This is hooked into of_clk_add_hw_provider() and
  of_clk_add_provider()
* updates gs101 to remove the 'critical' flag from affected clocks, as
  not necessary. This is essentially the last remaining patch [1] with
  all review comments addressed, from the series [2] that was sent
  earlier this year, see lore links below.
* updates i.MX to remove the now-unnecessary platform specific code in
  its clock drivers. I believe this also plugs a memory and extra clock
  reference leak at least on imx7ulp, see below.

Note 1: For the avoidance of doubt, any of the above is relevant only
        if earlycon and OF are enabled, behaviour is based on the
        'earlycon' kernel command line parameter.
        As this is meant to also replace i.MX specific code, the
        'earlyprintk' is also supported (since it was supported on
        i.MX)

Note 2: On i.MX, at least clk-imx7ulp.c calls
        imx_register_uart_clocks() twice (once for each compatible),
        but imx_register_uart_clocks() can not handle that and will
        leak memory and clock references in that case.
        The new clk core code handles multiple invocations without such
        issues.

Note 3: I am not in a position to test any of the i.MX changes and
        would appreciate feedback. In particular with these changes
        stdout clocks are enabled when of_clk_add_hw_provider() or
        of_clk_add_provider() return, but:
        * some i.MX platforms did some reparenting or frequency changes
          in the old approach before enabling stdout clocks. I believe
          they're all unrelated to stdout, though
        * some i.MX platforms enabled stdout clocks before the call to
          of_clk_add_hw_provider() or of_clk_add_provider(). Again, I
          don't think that difference is going to be relevant.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

[1] https://lore.kernel.org/all/20240130093812.1746512-6-andre.draszik@linaro.org/
[2] https://lore.kernel.org/all/20240130093812.1746512-1-andre.draszik@linaro.org/
[3] https://lore.kernel.org/all/d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org/

Changes in v5:
- move stdout uart clock handling from gs101 into clk core (Stephen)
- update i.MX to drop now-unnecessary code
- update series' subject due to changed scope
- Link to v4: https://lore.kernel.org/r/20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org

Changes in v4:
- new patch "clk: samsung: gs101: allow earlycon to work unconditionally"
- update commit message for patch 2
- Link to v3: https://lore.kernel.org/r/20240710-gs101-non-essential-clocks-2-v3-0-5dcb8d040d1c@linaro.org

---
André Draszik (20):
      clk: bump stdout clock usage for earlycon
      clk: samsung: gs101: don't mark non-essential (UART) clocks critical
      clk: imx: imx25: drop call to imx_register_uart_clocks()
      clk: imx: imx27: drop call to imx_register_uart_clocks()
      clk: imx: imx35: drop call to imx_register_uart_clocks()
      clk: imx: imx5: drop call to imx_register_uart_clocks()
      clk: imx: imx6q: drop call to imx_register_uart_clocks()
      clk: imx: imx6sl: drop call to imx_register_uart_clocks()
      clk: imx: imx6sll: drop call to imx_register_uart_clocks()
      clk: imx: imx6sx: drop call to imx_register_uart_clocks()
      clk: imx: imx6ul: drop call to imx_register_uart_clocks()
      clk: imx: imx7d: drop call to imx_register_uart_clocks()
      clk: imx: imx7ulp: drop calls to imx_register_uart_clocks()
      clk: imx: imx8mm: drop call to imx_register_uart_clocks()
      clk: imx: imx8mn: drop call to imx_register_uart_clocks()
      clk: imx: imx8mp: drop call to imx_register_uart_clocks()
      clk: imx: imx8mq: drop call to imx_register_uart_clocks()
      clk: imx: imx8ulp: drop call to imx_register_uart_clocks()
      clk: imx: imx93: drop call to imx_register_uart_clocks()
      clk: imx: drop imx_register_uart_clocks()

 drivers/clk/clk.c               | 129 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx25.c     |   2 -
 drivers/clk/imx/clk-imx27.c     |   2 -
 drivers/clk/imx/clk-imx35.c     |   2 -
 drivers/clk/imx/clk-imx5.c      |   6 --
 drivers/clk/imx/clk-imx6q.c     |   2 -
 drivers/clk/imx/clk-imx6sl.c    |   2 -
 drivers/clk/imx/clk-imx6sll.c   |   2 -
 drivers/clk/imx/clk-imx6sx.c    |   2 -
 drivers/clk/imx/clk-imx6ul.c    |   2 -
 drivers/clk/imx/clk-imx7d.c     |   2 -
 drivers/clk/imx/clk-imx7ulp.c   |   4 --
 drivers/clk/imx/clk-imx8mm.c    |   2 -
 drivers/clk/imx/clk-imx8mn.c    |   2 -
 drivers/clk/imx/clk-imx8mp.c    |   2 -
 drivers/clk/imx/clk-imx8mq.c    |   2 -
 drivers/clk/imx/clk-imx8ulp.c   |   2 -
 drivers/clk/imx/clk-imx93.c     |   2 -
 drivers/clk/imx/clk.c           |  72 ----------------------
 drivers/clk/imx/clk.h           |   7 ---
 drivers/clk/samsung/clk-gs101.c |   7 +--
 21 files changed, 132 insertions(+), 123 deletions(-)
---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240430-gs101-non-essential-clocks-2-6a3280fa1be8

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

