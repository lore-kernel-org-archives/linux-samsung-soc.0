Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F03F7A88
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 22:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067876; cv=none; b=J/2alLfZQfBT3tP45R0U60dDsX/lEHbaegs0q6ZaPHjull0tWQzca4OnrF2vBIAmicV72eWQ/0mULYremXeEiWTqs3eNQ4oGIEr9zTqzoO2QgxKkudarplWocSSShmuV42CW0PqKhdS8+z9sFLuId9qS2gybuHddeIAmjfGwRR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067876; c=relaxed/simple;
	bh=FN81vVRYQfdR/TDhA7SCFC6uiazv8rfChXbSb5+/SD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rj64RIleVnFMPh8dIU0W3SCQA0np8K/HokS6gvEtkk0YbL7MsBho49szo2Z8HzJ/G/Id0L6Ug9VB7BYOZokCASLjm0fkm0z6x08r4wK9G0G0toC2NjrgU8K8ft4bYAWFAJW79I03dF913g6Nm1ZgS0xr4x1UuYXbnC2aDYy4XdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MAsO/U7h; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MAsO/U7h"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38175907a56so48956a91.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 15:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784067873; x=1784672673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tetAXGJGm6WY4YSFyXOkWGhCtbJ9Cx/UiZBqb92zmI=;
        b=MAsO/U7hlK3pr1eklYh49v5qavE1Go/V2C5iBLyGjtj2ZpGCFWp9VCZ5g+TAupXE9E
         ImbuYpS4Nq7etk8+rmMDgIjy7RiowFa6SKZCBBCtNvsNpjCcF/Icr15Dh9LIub7Rqt80
         okEDFaNWGW097XDE+qXr56qMhTItQjYej8mMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067873; x=1784672673;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9tetAXGJGm6WY4YSFyXOkWGhCtbJ9Cx/UiZBqb92zmI=;
        b=fViMWbp52xY1i3hv7wJkfTAF1vxx9Ak6te6Hs8ozpyjRjuaN1djztBpHfKdGUby579
         EUnlXHRUbI2M4iB2kE4HzkQDwDWrYVqKrT6/VpuiL8dpTmBWe4A0bnuKys0bmMHmfrWo
         7j+QwlJFGzOyBQg0TOV3zjONeaikuixHh4pi3dqFVtg3Wxhq8L9VZrK6ITCEo7WsumNs
         IZOk/szgPyEw3kbpTnfORsChsnKYJvU1nxwIidnBkqWDpO1f1WN3gr/Kfj7Ez8qIqJq5
         R6Dz2asjTThiY+f31Lm/gAPrJ/eI9BvzL1fIPopcK51aytNpj6myKnLCmCHu++7WCE1r
         YvXg==
X-Forwarded-Encrypted: i=1; AHgh+RrUa/mOKU1BtUjnSu01bGGxqZBrdkeLV/0TiFphS9jK0nV2wXE+n2sqT4ESZFxUAO711xpoegMxcN9SfI0LLpoejg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/g41AOAaTG0mAKUNQnWkKxBfq+eQlcxpqqx3mklnFl0+KGswB
	LM1roPzSZfxrQi36KSqWYQMqvqj84QQTdjklgik361gimQvTt9FyelvsxU/CsX0rvg==
X-Gm-Gg: AfdE7clmMAozVgWG4lRN2tBN1+IqusvuciyFlLKYgnPAyqLuqxm+otKtm507czxzdWC
	/L6aFdaZ913LMvvge+ZKOETEekJ09xMSk8RAO5IuJl2sQ9AYD6YkOVtDqnq/jpixalcKPD3kufB
	DlyUUvMuLFyAKLTAG3V8AUW7izsO+J9WtcI5CDZ9sW1P4J9HR/23yPnAjTv7ccNJH1M52U0jq8w
	K2cv/kxlc/mYaWpZ7VJuzrAVgIz5OQ6fHB6ZQMrWhKmfYz2mM0TQhgNA4HJomlQcb0zXMW0kPuo
	V88MW7r1HsgXah9fnnUnIUbjsNqaXfTsr82+BNeA/lgmbR0SdsEaVNGU3fUSKRaN4VBOHz+Kj53
	cYNLHxrQKrQYt9CC39VkHg9/ZpPNzUiOhoCnlxcQkmFlDzWxY6FJw/B7XL7OpRPGOruNsyfX1sM
	fMyQHV5sTDU0qWgxwOv/xrevpiY5r2yYX/3BCOgce9nVL422FhM+cFmwBJy5jpRUWScm71Uw==
X-Received: by 2002:a17:90b:4f:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38d13f5fb5dmr21455803a91.6.1784067873033;
        Tue, 14 Jul 2026 15:24:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:32cb:eed4:7c:dc87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm76540741eec.9.2026.07.14.15.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:24:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/7] mailbox: Improve the mbox core then introduce the goog-mba driver
Date: Tue, 14 Jul 2026 15:21:39 -0700
Message-ID: <20260714222338.2965707-1-dianders@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The goal of this series is to land support for the goog-mba (MailBox
Array) IP block that's present in Pixel 10 phones.

As can be seen in the device-tree bindings for the goog-mba IP block,
the mailbox IP block in Pixel 10 phones is fairly sophisticated.
Notably:
* It has hardware features that support queuing, meaning that more
  than one mailbox message can be pending at a time.
* The "channels" in a given mailbox array aren't homogeneous. Each
  "channel" in the mailbox array can have a different amount of memory
  for messages. Really, the "channels" in a mailbox are considered to
  be full single-channel mailboxes and a grouping of mailboxes is
  considered a "mailbox array" (hence the IP block being named "mba")

In order to cleanly support some of the sophisticated goog-mba
features, improvements are made to the mailbox core. Specifically,
support for mailbox controllers that can queue is added and also
support for mailbox drivers that have more than one sub-node is added.

This is a fairly big rewrite from the downstream MBA driver shipping
on Pixel 10 phones, which awkwardly makes due without the improvements
to the mailbox core. It has been lightly tested both by porting it to
an experimental downstream tree based on 7.1 and also by running it
directly upstream against a stripped down Pixel 10 device tree.


Douglas Anderson (7):
  dt-bindings: mailbox: Don't require #mbox-cells to be 1
  mailbox: Allow #mbox-cells = <0> without specifying a custom xlate
  mailbox: Find a matching mailbox by fwnode rather than device
  mailbox: Simplify circular queue math with mod arithmetic
  mailbox: Add support for mailbox controllers that can queue
  dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
  mailbox: goog-mba: Introduce the goog-mba mailbox driver

 .../bindings/mailbox/google,mba.yaml          | 216 +++++++
 .../devicetree/bindings/mailbox/mailbox.txt   |   6 +-
 MAINTAINERS                                   |   8 +
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/goog-mba-priv.h               | 108 ++++
 drivers/mailbox/goog-mba-trace.h              | 183 ++++++
 drivers/mailbox/goog-mba.c                    | 567 ++++++++++++++++++
 drivers/mailbox/mailbox.c                     |  84 ++-
 include/linux/mailbox/goog-mba-message.h      |  38 ++
 include/linux/mailbox_controller.h            |  15 +-
 11 files changed, 1209 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,mba.yaml
 create mode 100644 drivers/mailbox/goog-mba-priv.h
 create mode 100644 drivers/mailbox/goog-mba-trace.h
 create mode 100644 drivers/mailbox/goog-mba.c
 create mode 100644 include/linux/mailbox/goog-mba-message.h

-- 
2.55.0.141.g00534a21ce-goog

