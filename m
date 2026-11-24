Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547128;
	b=WrwbaoGyCl1858p7Hvwmtj0wEwKj/04Szlb+6LIME4VzFp5WFBI3w5gNtLvWGqkHUhcG
	 LwP74795T/SEHdu5UFay3KfUfJtXh1qha3cihwT+0BavhyvJYtF6Ed53clC1w7ikTPzUe
	 GJy3K+hRj31di7zDP7oCfHfwuD6MImak8yutZeu9vJzclSK3Y6z+8EjmXRo6ktt3G3jU8
	 rvx9QmGTwiccxzZOiMc+o5ykmnvoV0/vgEj++0i5FtXYGyxGpRQbSqb82qI+mQvHtgtBE
	 VJzmn5GlafoomHn7JI22R8DMjC1OoKgbwu9XRq+JC/a0c8G+IOIYxA22JMQWnnut3KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oRymF9g7Ou6E84Fcm6RvQE44N4Aj97+O2QyjNvisAjA=;
	b=PHFHYqHKPfouXyPLc2KZNo86z3tgFmd7DBfBp+VsJ6noujs3cfPNJFrPWy/lQ5+tkd1h
	 atUhsxaa8YhL64J/CYgQ9Bw8NSgm6Ar7rcChBSX8/QxRF/FgEAxWLlG4ra3EJD5FQhoZg
	 kFVGhjq8DS86bpsBIcjyvX4xfslH1A08c+4zKKsd/p88cYUQwFDn3VSntqhbwc0sYr6fJ
	 vD4Cd6NO1RG10uppzdikvP1tqt5sZk3hafk/iPWzSjsZG7mbt4rvBc9QYvskLY7TvkDSh
	 ts9xGgT8wUMCMncuBmqxGFrHV8chximYWeGLB1Op46ESCEC+IppVHP1YiZiwmpkvU3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="LaQ/DrsS";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADAF606A327
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2026 19:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADAF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LaQ/DrsS
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso4704568c88.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2026 11:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795547127; x=1796151927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRymF9g7Ou6E84Fcm6RvQE44N4Aj97+O2QyjNvisAjA=;
        b=LaQ/DrsSf/lTSKvebzDUDO0d/SHlG21H7sH+cy2n5Opuq5APd2coUYIy+qQpQcVw4R
         0BV9TbeCVyo44f/hbGV92P3ImsMclWWCBp/vJiP8cse/parjod0QWq640h6Itmt7KGot
         KhUQc+NJfF+SZ6jCEIuWmdYI0PlW4M6xWEVe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547127; x=1796151927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRymF9g7Ou6E84Fcm6RvQE44N4Aj97+O2QyjNvisAjA=;
        b=TDfGpUXfqVrqwdgZOghutYXYKzKhyFFfrUiNPhCapSZRDScAmEaLcoeb1K9UQa+5xI
         q70ndSjThhe1gwBSJOXM9hC+EvGk5hDgNlDQxJ8i2ZFDaTSp/h3nJUYZTfcGWJQR3O7d
         A4LzP3wjp1TiFy4NIqEdPbkaroDuS+ESh4qJl5akhBWrNmrDc0di/8+br9726ovLmxIK
         tiKDZN5tlfCv+8B4xX0XOvhc00UhQsxpApfThft0f/AWL6cOsed20S9d+qsod3eD9ozi
         hsPYqstfL9HmnfQS0imhSpM5+zQaABYnM0HhATJYLME4fNCAJTDOsq+R/c1CVyTGTqi4
         qWQg==
X-Forwarded-Encrypted: i=1; AL+hErGMbh/gQNFiQMr6q+2QFT+Oe2wAgeQvGb/KlZ28MCjAllX/FUYATq+UKZDfCUzHJXrLCD675dH7zpiEOXzz5/AuAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6URtm9sE9zW0+NDmjWlDWLxvdoI9i5HpY3geB09xcul00VkTs
	1oiYCTH44eQI54c0YNI3xY5DaRta/AmiK5vNBffPn6Pl3JBvlxNpWVO5fyQTNFd5hw==
X-Gm-Gg: AZFdTZdtoczeRYiuSgWEGknIjCZ8A9P3cTLnHxFAQX+EMd4EKp93dwyI0GoPAuKNKv5
	RKbBQsiQL06pVFYVe/qnVZPSZymydRCrDlWCWu6MS67M11z80BzPXpjEbSsrbGtH97WqsucjSns
	fZd7dWqPqtK08MKXDhY/68Qkbtq0Wu9ynOBNExcvZvoKXCb1mlOwnvIaKG/wQg4mRfZaLWH/XvM
	XWgsjFYh+eb2pCJGLvLzFoqYXYSA56iMCi27h5OlwndbYvA1a4yD1IgwpLED42wGDd2xfMCbvl2
	g9IVO/xwHaI7/zQg6ke9AJv6aPgTU0x2WbMmNILcOqp1hmBR+uu97TKU3dAL1sDUyiM7FxUJGGA
	E9Fd5psE9c2Uu6SRj2luqFW03fApl+po/pPMG6GBtA+sfzRu/kpTT0R5S8BkvLA7B7s3Rd9pAJY
	VmRbckbmWwIbWH8gIjzEcSfAO7UfyHvSRau15/ikFQOkrmSFYQHocBit7YaEKbiLvyQamo7DXts
	jNpVK1JRqE3n/HHpgICi+V3gykNCYYxVaOnTNy9eOnnTm0uayeDYwy1Hx6R85iin8wuQlEBdkwN
	RlUh366+tgStCSKNBBBGxE5z0WKXfgRTP24lRQNveYsGl8gvmJwAq6lbtiLOzqKIzRIO
X-Received: by 2002:a05:7023:a41:b0:1b5:4b48:b9ee with SMTP id a92af1059eb24-1b5568c0ec9mr15438832c88.26.1795547127198;
        Tue, 24 Nov 2026 11:05:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3866f299d0bsm39337143eec.19.2026.11.24.11.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:05:26 -0800 (PST)
Date: Tue, 24 Nov 2026 11:05:23 -0800
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <awXf86suGgKeazZx@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>

On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> Hi Brian,
> 
> Thanks for your series; it's great to see more Laguna support being posted.
> 
> On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
> >
> > The Central Power Manager (CPM) is a co-processor on the Google Tensor
> > SoCs, as used on Pixel phones. CPM supports power-management and a
> > number of other features.
> >
> > The Application Processor communicates with CPM over a pair of mailbox
> > channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> > reset, interrupt services, and more.
> 
> [..]
> 
> +++ b/drivers/soc/google/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config GOOGLE_CPM_MBA
> +       tristate "Google Tensor CPM MailBox Array Interface"
> +       depends on ARCH_GOOGLE || COMPILE_TEST
> +       depends on MAILBOX
> 
> Should we also have "depends on OF"?

Why, precisely? It's not actually a compilation dependency (I tested),
although it's needed at runtime. It doesn't seem like this is
consistently done simply for runtime dependencies, and instead work has
generally been done to ensure everything builds fine and fails closed
without CONFIG_OF.

Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.

> +       select AUXILIARY_BUS
> +       help
> +         Driver for interfacing with the Central Power Manager (CPM) MailBox
> +         Array (MBA) found on Google Tensor SoCs. The driver provides APIs for
> +         communication between the Application Processor and the CPM, and
> +         is required by CPM client drivers such as clock, reset, power
> +         domain, and more.
> 
> > diff --git a/drivers/soc/google/google-cpm-mba.c b/drivers/soc/google/google-cpm-mba.c
> > new file mode 100644
> > index 000000000000..629a071e202c
> > --- /dev/null
> > +++ b/drivers/soc/google/google-cpm-mba.c
> > @@ -0,0 +1,964 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Google MailBox Array (MBA) CPM Interface
> > + *
> > + * Copyright 2023-2026 Google LLC
> > + */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/completion.h>
> > +#include <linux/device.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/kref.h>
> > +#include <linux/list.h>
> > +#include <linux/lockdep.h>
> > +#include <linux/mailbox/goog-mba-message.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> 
> Missing `#include <linux/slab.h>` header here as later it calls
> kfree(), kzalloc_obj().
> This can cause "implicit declaration of function kfree / kzalloc_obj"
> errors with COMPILE_TEST. Also similar issue in clk-cpm.c

Ack, will fix.

> > +
> > +#include <soc/google/google-cpm-mba.h>
> > +
> > +#include "google-cpm-mba.h"
> > +
> 
> [..]
> > +static bool cpm_iface_is_valid_req(struct cpm_data *cpm,
> > +                                  struct cpm_request *cpm_req)
> > +{
> > +       struct device *dev = cpm->dev;
> > +
> > +       if (!cpm_req) {
> > +               dev_err(dev, "cpm_req is NULL\n");
> > +               return false;
> > +       }
> > +
> > +       if (!cpm_req->req_msg) {
> > +               dev_err(dev, "cpm_req->req_msg is NULL\n");
> > +               return false;
> > +       }
> > +
> > +       if (cpm_req->msg_type > RESPONSE_MSG || cpm_req->msg_type < ONEWAY_MSG) {
> > +               dev_err(dev, "Invalid msg_type: %d\n", cpm_req->msg_type);
> > +               return false;
> > +       }
> 
> Should cpm_req->dst_id also be range checked?

This will be refactored on v2, where dst_id will be u8 and so will
always be in-bounds.

> > +
> > +       if (cpm_is_request_msg(cpm_req) && !cpm_req->resp_msg) {
> > +               dev_err(dev, "cpm_req->resp_msg is NULL when msg_type is REQUEST_MSG\n");
> > +               return false;
> > +       }
> > +
> > +       if (cpm_is_response_msg(cpm_req)) {
> > +               if (!goog_mba_q_get_valid(&cpm_req->resp_context)) {
> > +                       dev_err(dev, "Invalid valid bit in resp_context: %#x\n",
> > +                               cpm_req->resp_context);
> > +                       return false;
> > +               }
> > +
> > +               if (!cpm_is_response_header(&cpm_req->resp_context)) {
> > +                       dev_err(dev, "Invalid response type in resp_context: %#x\n",
> > +                               cpm_req->resp_context);
> > +                       return false;
> > +               }
> > +       }
> > +
> > +       return true;
> > +}
> > +
> 
> [..]
> 
> > +
> > +static int cpm_init_q_mode_proto(struct cpm_data *cpm)
> > +{
> > +       struct cpm_payload msg_payload = {};
> > +       struct cpm_request req = {
> > +               .msg_type = ONEWAY_MSG,
> > +               .req_msg = &msg_payload,
> > +       };
> > +
> > +       return __cpm_send_message(cpm, &req, GOOG_MBA_Q_INIT_PROTO_VAL, 0);
> 
> Do we want this to have an infinite timeout? If the CPM firmware never
> responds, it will hang the boot (as MAX_SCHEDULE_TIMEOUT doesn't arm a
> timer).
> I guess it is game over anyway if the CPM firmware is dead, but it
> would be nice to log an error and return from probe()

Hmm, I suppose a timeout would be OK, although definitely fatal to any
useful purpose of the system.

> > +}
> > +
> > +static int cpm_init_q_mode(struct cpm_data *cpm)
> > +{
> > +       int ret;
> > +
> > +       ret = cpm_init_q_mode_proto(cpm);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       cpm->seq_num = GOOG_MBA_Q_MIN_SEQ_VAL;
> > +
> > +       return 0;
> > +}
> > +
> > +static void cpm_adev_release(struct device *dev)
> > +{
> > +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > +
> > +       of_node_put(dev->of_node);
> > +       kfree(adev);
> > +}
> > +
> > +static void cpm_unregister_adev_action(void *data)
> > +{
> > +       struct auxiliary_device *adev = data;
> > +
> > +       auxiliary_device_delete(adev);
> > +       auxiliary_device_uninit(adev);
> > +}
> > +
> 
> Can we use devm_auxiliary_device_create() instead of open coding these?

Yes.

I think this (and some planned subsequent changes) have morphed a bit
over my development time, as there were some cases where we could not
reuse the same of_node. But this current patch can use it, and I also
think future changes will likely just use mfd / of_platform_populate()
if they require subnodes, so my initial concern is probably invalid.

> > +static int cpm_register_adev(struct cpm_data *cpm, const char *name)
> > +{
> > +       struct auxiliary_device *adev;
> > +       int ret;
> > +
> > +       adev = kzalloc_obj(*adev, GFP_KERNEL);
> > +       if (!adev)
> > +               return -ENOMEM;
> > +
> > +       adev->name = name;
> > +       adev->id = 0;
> > +       adev->dev.parent = cpm->dev;
> > +       adev->dev.release = cpm_adev_release;
> > +       device_set_of_node_from_dev(&adev->dev, cpm->dev);
> > +
> > +       ret = auxiliary_device_init(adev);
> > +       if (ret) {
> > +               of_node_put(adev->dev.of_node);
> > +               kfree(adev);
> > +               return ret;
> > +       }
> > +
> > +       ret = auxiliary_device_add(adev);
> > +       if (ret) {
> > +               auxiliary_device_uninit(adev);
> > +               return ret;
> > +       }
> > +
> > +       return devm_add_action_or_reset(cpm->dev, cpm_unregister_adev_action, adev);
> > +}
> > +
> 
> [..]
> 
> > +
> > +MODULE_DESCRIPTION("Google MBA CPM interface");
> > +MODULE_AUTHOR("Lucas Wei <lucaswei@google.com>");
> 
> I think you should add Lucas Wei's SoB tag to the patch as part of the DCO

I keep going back and forth in my head on this one, since these drivers
did indeed start from the same source with the professed MODULE_AUTHOR.
But they've been massively rewritten, so they're similar in a sort of
Ship of Theseus way.

I suppose I'll retain the MODULE_AUTHOR() and update the SoB.

Regards,
Brian
