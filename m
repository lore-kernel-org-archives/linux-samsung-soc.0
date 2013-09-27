From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI: exynos: turn off power of phy block when link failed
Date: Fri, 27 Sep 2013 13:10:36 -0600
Message-ID: <CAErSpo5nQ56Hz2xyuNfA=PDnekWZTOx6UoEtc6-duv8ackEj=Q@mail.gmail.com>
References: <002301ceaada$1ffa8fb0$5fefaf10$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:58197 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754338Ab3I0TK4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 15:10:56 -0400
Received: by mail-ie0-f173.google.com with SMTP id ar20so4862356iec.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Sep 2013 12:10:56 -0700 (PDT)
In-Reply-To: <002301ceaada$1ffa8fb0$5fefaf10$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On Fri, Sep 6, 2013 at 2:21 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> When link failed, there is no need to turn on phy block. Also,
> turning on phy block is added, in order to turn on phy block
> regardless of the default value of phy registers.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Applied to my pci/host-exynos branch for v3.13.  Thanks!

Bjorn
