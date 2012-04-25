From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 00/33] Use common macro to define resources
Date: Wed, 25 Apr 2012 06:19:39 +0200
Message-ID: <20120425041939.GL9142@game.jcrosoft.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tushar Behera <tushar.behera@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09:42 Wed 25 Apr     , Tushar Behera wrote:
> There are some helper macros (DEFINE_RES_XXX) for defining resource
> structures. This patchset migrates all the earlier resource
> definitions (within Samsung specific code base) to use these macros.
> 
> In some cases, it was not possible to use DEFINE_RES_IRQ() macro because
> of usage of additional flags. In those cases, DEFINE_RES_NAMED() macro
> is used instead.
> 
> The patches are rebased on top of Kukjin's for-next branch at this commit.
> 
> d0ee53a Merge branch 'next/board-samsung' into for-next
is this really necessary as we switch to DT this code will be droped

for my point of view it's cosmetics change

Arnd what  do you think?

Best Regards,
J.
