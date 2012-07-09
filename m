From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 0/1] dmaengine/amba-pl08x: Add support for s3c64xx DMAC
Date: Mon, 9 Jul 2012 22:47:48 +0200
Message-ID: <CACRpkda5kfF3o8L4vXRqKsbZC4N_Od9Z2td5zfB_5kJkPmu2Xg@mail.gmail.com>
References: <1317189007-23033-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1317189007-23033-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, viresh.kumar@st.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 28, 2011 at 7:50 AM, Alim Akhtar <alim.akhtar@samsung.com> wrote:

> This patch modifies the amba-pl08x driver for s3c64xx.
> The DMA controller of S3C64XX is a variant of PrimeCell pl080 DMAC.
> S3C64xx contents extra register to hold the TransferSize.

Ping on this. Russell's patches have landed in linux-next so you can
rebase your patches on top of what's in linux-next for a convenient
testbed.

Yours,
Linus Walleij
