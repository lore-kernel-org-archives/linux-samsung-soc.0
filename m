From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] usb: host: ehci-exynos: Decrese node refcount on
 exynos_ehci_get_phy() error paths
Date: Mon, 9 Jan 2017 12:39:22 -0300
Message-ID: <8a9d9fe4-5f24-e162-0adc-866c8eefd387@osg.samsung.com>
References: <20170107084141.3731-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170107084141.3731-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/07/2017 05:41 AM, Krzysztof Kozlowski wrote:
> Returning from for_each_available_child_of_node() loop requires cleaning
> up node refcount.  Error paths lacked it so for example in case of
> deferred probe, the refcount of phy node was left increased.
> 
> Fixes: 6d40500ac9b6 ("usb: ehci/ohci-exynos: Fix of_node_put() for child when getting PHYs")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
