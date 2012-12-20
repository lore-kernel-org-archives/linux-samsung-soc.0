From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Fri, 21 Dec 2012 00:18:39 +0100
Message-ID: <3158118.uctD3XVWRG@flatron>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
 <1464138.NEt7mMkYJc@flatron> <50D38F04.8020307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50D38F04.8020307@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Subash Patel <subashrp@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Subash,

On Thursday 20 of December 2012 14:19:48 Subash Patel wrote:
> I would like to ask a question here. Do we need to have sparse even if
> the physical memory is contiguous? All the recent exynos machines come
> with physical banks without any holes, and I am thinking why not drop it
> and use flat mem instead. With LPAE these sections sizes wont be useful,
> and I dont like to keep different section sizes for different
> configurations. Any suggestions/opinions are very much helpful to me.

Since sparse memory is the only option available on Exynos currently in 
kernel configuration, I assume there was a reason for it. However I am not 
an expert in memory management, so please correct me if I am wrong.

Best regards,
Tomasz Figa
